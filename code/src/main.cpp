#include <Arduino.h>

#include "webserver.h"
#include "wifi.h"
#include "motorcontrol.h"
#include "dataStore.h"
#include "scheduler.h"
#include "timeKeeper.h"
#include "jsonUtils.h"
#include "notifications.h"

Settings getSettings();
void setSettings(Settings settings);

bool isValidFeedAmount(float cups);
void feed(Feeding feeding);

Schedule getNextScheduledFeeding();
void scheduledFeed(Schedule schedule);
void scheduleNextFeeding();
void addScheduledFeeding(Schedule schedule);
void deleteScheduledFeeding(std::string id);

const float MINIMUM_DISPENCE_AMOUNT = 0.125;
const int CONTAINERS_PER_ROTATION = 2;
bool timeKeeperAvailable = false;
const char* notificationsAuthorizationKey = "AAAAeYpJcNM:APA91bFW0WSI91TuBrMvtgt3ZmRwlKOnXR4raZKxMiwWuW1Ps1-rb53FSQ9IC9OJMvWAsIVkFPjYtcO7tb3wFIDm_TGXRtCoEh__pI_esTSglCDiwFKcXl-87Zw4dBP1rizDf6tvmn0-";

TimeKeeper *timeKeeper = new TimeKeeper();

WiFiConnection* wifi = new WiFiConnection();
WebServer* webServer = new WebServer(80, timeKeeper);
MotorControl* motorControl = new MotorControl(CONTAINERS_PER_ROTATION);
DataStore* dataStore = new DataStore();
Scheduler* scheduler = new Scheduler(timeKeeper);
Notifications* notifications = new Notifications();

Settings _settings;

void setup() {
    Serial.begin(115200);
    delay(10);
    Serial.print('\n');

    randomSeed(analogRead(0));

    if(!dataStore->begin()) {
        Serial.println("SD Card initialization failed.");
    }
    _settings = dataStore->getSettings();

    wifi->begin(_settings);

    Serial.println("Settings:");
    Serial.print("\tSSID: '");
    Serial.print(_settings.ssid.c_str());
    Serial.println("'");
    Serial.print("\tName: '");
    Serial.print(_settings.name.c_str());
    Serial.println("'");

    timeKeeper->begin();

    notifications->begin(notificationsAuthorizationKey);
    notifications->onGetAllRegisteredDevices(std::bind(&DataStore::getAllRegisteredDevices, dataStore));

    webServer->onGetSettings(getSettings);
    webServer->onSettingsChanged(setSettings);
    
    webServer->isValidFeedAmount(isValidFeedAmount);
    webServer->onFeed(feed);
    webServer->onGetFeedings(std::bind(&DataStore::getAllFeedings, dataStore));

    webServer->onGetAllScheduledFeedings(std::bind(&DataStore::getAllSchedules, dataStore));
    webServer->onAddScheduledFeeding(addScheduledFeeding);
    webServer->onDeleteScheduledFeeding(deleteScheduledFeeding);

    webServer->onRegisterDevice(std::bind(&DataStore::putRegistration, dataStore, std::placeholders::_1));
    webServer->onDeleteRegistration(std::bind(&DataStore::deleteRegistration, dataStore, std::placeholders::_1));

    webServer->startServer();
}

void loop() {
    wifi->checkStatus();
    webServer->handleClient();
    scheduler->update();

    if(timeKeeper->update() && !timeKeeperAvailable) {
        timeKeeperAvailable = true;
        scheduleNextFeeding();
    }
}

Settings getSettings() {
    return _settings;
}

std::string nullCoalesceString(std::string a, std::string b) {
    if(a.empty()) {
        return b;
    } else {
        return a;
    }
}

void setSettings(Settings settings) {
    Serial.println(settings.name.c_str());

    std::string ssid = nullCoalesceString(settings.ssid, _settings.ssid);
    std::string password = nullCoalesceString(settings.password, _settings.password);
    std::string name = nullCoalesceString(settings.name, _settings.name);

    if(!settings.ssid.empty() && settings.password.empty()) {
        password = "";
    }

    uint8_t fcm[sizeof(_settings.fcm_fingerprint)];
    memcpy(fcm, _settings.fcm_fingerprint, sizeof(fcm));

    _settings = {
        .ssid = ssid,
        .password = password,
        .name = name
    };

    bool isFCMEmpty = true;
    for(unsigned int i = 0; i < sizeof(settings.fcm_fingerprint); i++) {
        if(settings.fcm_fingerprint[i] != 0) {
            isFCMEmpty = false;
            break;
        }
    }
    if(isFCMEmpty) {
        memcpy(_settings.fcm_fingerprint, fcm, sizeof(_settings.fcm_fingerprint));
    } else {
        memcpy(_settings.fcm_fingerprint, settings.fcm_fingerprint, sizeof(_settings.fcm_fingerprint));
    }
    
    dataStore->put(_settings);
    wifi->begin(_settings);
}

bool isValidFeedAmount(float cups) {
    return fmod(cups, MINIMUM_DISPENCE_AMOUNT) == 0;
}

void feed(Feeding feeding) {
    Serial.print("Dispensing ");
    Serial.print(feeding.cups);
    Serial.print(" cups of food");

    for(float i = 0; i < feeding.cups; i+=MINIMUM_DISPENCE_AMOUNT) {
        Serial.print(".");
        motorControl->feed();
        delay(1000);
    }
    Serial.println();

    notifications->send(_settings, feeding);

    dataStore->put(feeding);
}

Schedule getNextScheduledFeeding() {
    std::vector<Schedule> scheduledFeedings = dataStore->getAllSchedules();

    if(scheduledFeedings.size() > 0) {
        return *std::min_element(scheduledFeedings.begin(), scheduledFeedings.end(), [](Schedule const& lhs, Schedule const& rhs) {
            time_t ltime = timeKeeper->next(lhs.hour, lhs.minute);
            time_t rtime = timeKeeper->next(rhs.hour, rhs.minute);

            return ltime < rtime;
        });
    } else {
        return Schedule {
            .id = "",
            .cups = 0,
            .hour = 0,
            .minute = 0
        };
    }
}

void scheduledFeed(Schedule schedule) {
    Feeding feeding = {
        .id = createUUID(),
        .cups = schedule.cups,
        .date = timeKeeper->now(),
    };

    feed(feeding);
}

void scheduleNextFeeding() {
    Schedule nextFeeding = getNextScheduledFeeding();
    if(nextFeeding.id == "") {
        return;
    }

    time_t time = timeKeeper->next(nextFeeding.hour, nextFeeding.minute);

    Serial.print("Scheduled next feeding for: ");
    Serial.println(time);

    scheduler->scheduleEvent(time, [nextFeeding]{
        scheduledFeed(nextFeeding);
        scheduleNextFeeding();
    });
}

void addScheduledFeeding(Schedule schedule) {
    dataStore->put(schedule);

    scheduler->cancelEvent();
    scheduleNextFeeding();
}

void deleteScheduledFeeding(std::string id) {
    dataStore->deleteSchedule(id);

    scheduler->cancelEvent();
    scheduleNextFeeding();
}
