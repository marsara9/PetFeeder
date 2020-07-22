#include "wifi.h"

#include <ESP8266WiFi.h>
#include <ESP8266mDNS.h>

const int NUMBER_OF_CONNECTION_ATTEMPTS = 10;

WiFiConnection::WiFiConnection() {
    settings = {
        .ssid = "",
        .password = "",
        .name = ("esp8266_" + String(random(1000))).c_str()
    };

    WiFi.setAutoConnect(true);
    WiFi.setAutoReconnect(true);
}

void WiFiConnection::begin(const Settings settings) {
    if(this->settings.name.compare(settings.name) != 0) {
        WiFi.hostname(settings.name.c_str());
        MDNS.begin(settings.name.c_str());
    }
    if(this->settings.ssid.compare(settings.ssid) != 0 || this->settings.password.compare(settings.password) != 0) {
        WiFi.disconnect(true);
        delay(10);
        WiFi.begin(settings.ssid.c_str(), settings.password.c_str());

        Serial.print("Connecting to '");
        Serial.print(settings.ssid.c_str());
        Serial.println("'...");
    }

    this->settings = settings;
}

void WiFiConnection::checkStatus() {
    if(WiFi.isConnected() && WiFi.getMode() & WIFI_AP) {
        Serial.print("Connected to:\t");
        Serial.println(WiFi.SSID());
        Serial.print("IP address:\t");
        Serial.println(WiFi.localIP());

        Serial.println("Turning off Access Point...");
        WiFi.softAPdisconnect(true);
    } else if(!WiFi.isConnected() && (WiFi.getMode() & WIFI_AP) == 0) {
        Serial.println("Setting up Access Point...");
        createAccessPoint();
    }

    MDNS.update();
}

bool WiFiConnection::createAccessPoint() {
    if(WiFi.softAP("ESP8266_"+random(9999))) {
        Serial.print("SSID:\t");
        Serial.println(WiFi.softAPSSID());
        Serial.print("IP address:\t");
        Serial.println(WiFi.softAPIP());
        return true;
    }
    return false;
}
