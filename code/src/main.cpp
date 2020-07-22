#include <Arduino.h>

#include "webserver.h"
#include "wifi.h"
#include "motorcontrol.h"
#include "dataStore.h"

#include <ESP8266WiFi.h>

Settings getSettings();
void setSettings(Settings settings);
bool isValidFeedAmount(float cups);
void feed(Feeding feeding);

const float MINIMUM_DISPENCE_AMOUNT = 0.125;
const int CONTAINERS_PER_ROTATION = 2;

WiFiConnection* wifi = new WiFiConnection();
WebServer *webServer = new WebServer(80);
MotorControl *motorControl = new MotorControl(CONTAINERS_PER_ROTATION);
DataStore *dataStore = new DataStore();
Settings _settings;

void setup() {
    Serial.begin(115200);
    delay(10);
    Serial.print('\n');

    _settings = dataStore->getSettings();

    _settings = {
        .ssid = "Cicso05019",
        .password = "MarSdoras",
        .name = "ESP8266_1468"
    };

    wifi->setSettings(_settings);

    webServer->onGetSettings(getSettings);
    webServer->onSettingsChanged(setSettings);
    webServer->isValidFeedAmount(isValidFeedAmount);
    webServer->onFeed(feed);

    webServer->startServer();
}

void loop() {
    wifi->checkStatus();
    webServer->handleClient();
}

Settings getSettings() {
    Serial.println(_settings.name);

    return _settings;
}

const char* nullCoalesceString(const char* a, const char* b) {
    if(a != nullptr && strlen(a) > 0) {
        return a;
    } else if(b != nullptr && strlen(b) > 0) {
        return b;
    } else {
        return nullptr;
    }
}

void setSettings(Settings settings) {
    Serial.println(settings.name);


    const char* _ssid = nullCoalesceString(settings.ssid, _settings.ssid);
    const char* _password = nullCoalesceString(settings.password, _settings.password);
    const char* _name = nullCoalesceString(settings.name, _settings.name);

    if((settings.ssid != nullptr && strlen(settings.ssid) > 0) && (settings.password == nullptr || strlen(settings.password) > 0)) {
        _password = "";
    }

    char* ssid = new char[strlen(_ssid)];
    char* password = new char[strlen(_password)];
    char* name = new char[strlen(_name)];

    strcpy(ssid, _ssid);
    strcpy(password, _password);
    strcpy(name, _name);

    delete settings.name;
    delete settings.password;
    delete settings.name;

    _settings = {
        .ssid = ssid,
        .password = password,
        .name = name
    };
    
    dataStore->put(_settings);
    wifi->setSettings(_settings);
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
