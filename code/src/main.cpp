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

    webServer->onGetSettings(getSettings);
    webServer->onSettingsChanged(setSettings);
    webServer->isValidFeedAmount(isValidFeedAmount);
    webServer->onFeed(feed);
    webServer->onGetFeedings(std::bind(&DataStore::getAllFeedings, dataStore));

    webServer->startServer();
}

void loop() {
    wifi->checkStatus();
    webServer->handleClient();
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
