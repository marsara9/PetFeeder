#include <Arduino.h>

#include "webserver.h"
#include "wifi.h"
#include "motorcontrol.h"
#include "dataStore.h"
#include "scheduler.h"
#include "timeKeeper.h"

#include <ESP8266WiFi.h>

Settings getSettings();
void setSettings(Settings settings);

bool isValidFeedAmount(float cups);
void feed(Feeding feeding);

Schedule getNextScheduledFeeding();
void scheduledFeed(Schedule schedule);
void scheduleNextFeeding();
void addScheduledFeeding(Schedule schedule);

const float MINIMUM_DISPENCE_AMOUNT = 0.125;
const int CONTAINERS_PER_ROTATION = 2;

TimeKeeper *timeKeeper = new TimeKeeper();

WiFiConnection* wifi = new WiFiConnection();
WebServer *webServer = new WebServer(80, timeKeeper);
MotorControl *motorControl = new MotorControl(CONTAINERS_PER_ROTATION);
DataStore *dataStore = new DataStore();
Scheduler *scheduler = new Scheduler(timeKeeper);

Settings _settings;

void setup() {
    Serial.begin(115200);
    delay(10);
    Serial.print('\n');

    if(!dataStore->begin()) {
        Serial.println("SD Card initialization failed.");
    }
    _settings = dataStore->getSettings();

    scheduleNextFeeding();

    wifi->begin(_settings);

    Serial.println("Settings:");
    Serial.print("\tSSID: '");
    Serial.print(_settings.ssid.c_str());
    Serial.println("'");
    Serial.print("\tName: '");
    Serial.print(_settings.name.c_str());
    Serial.println("'");

    timeKeeper->begin();

    webServer->onGetSettings(getSettings);
    webServer->onSettingsChanged(setSettings);
    webServer->isValidFeedAmount(isValidFeedAmount);
    webServer->onFeed(feed);

    webServer->startServer();
}

void loop() {
    wifi->checkStatus();
    webServer->handleClient();
    timeKeeper->update();
    scheduler->update();
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

    _settings = {
        .ssid = ssid,
        .password = password,
        .name = name
    };
    
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

    dataStore->put(feeding);
}

Schedule getNextScheduledFeeding() {
    std::vector<Schedule> scheduledFeedings = dataStore->getAllSchedules();

    if(scheduledFeedings.size() > 0) {
        return std::max_element(scheduledFeedings.begin(), scheduledFeedings.end(), [](Schedule const& lhs, Schedule const& rhs) {
            time_t ltime = timeKeeper->next(lhs.hour, lhs.minute);
            time_t rtime = timeKeeper->next(rhs.hour, rhs.minute);

            return ltime < rtime;
        })[0];
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
        .id = "00000000-0000-0000-0000-000000000000", // TODO
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

    scheduler->scheduleEvent(timeKeeper->next(nextFeeding.hour, nextFeeding.minute), [nextFeeding]{
        scheduledFeed(nextFeeding);
        scheduleNextFeeding();
    });
}

void addScheduledFeeding(Schedule schedule) {
    dataStore->put(schedule);

    scheduler->cancelEvent();
    scheduleNextFeeding();
}
