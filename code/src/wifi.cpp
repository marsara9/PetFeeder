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

void WiFiConnection::setSettings(const Settings settings) {
    if(this->settings.name != settings.name) {
        WiFi.hostname(settings.name);
        MDNS.begin(settings.name);
    }
    if(strcmp(this->settings.ssid, settings.ssid) != 0 || strcmp(this->settings.password, settings.password) != 0) {
        WiFi.disconnect(true);
        delay(10);
        WiFi.begin(settings.ssid, settings.password);

        Serial.print("Connecting to '");
        Serial.print(settings.ssid);
        Serial.println("'...");
    }

    this->settings = settings;
}

bool WiFiConnection::createAccessPoint() {
    if(WiFi.softAP(settings.name)) {
        Serial.print("SSID:\t");
        Serial.println(WiFi.softAPSSID());
        Serial.print("IP address:\t");
        Serial.println(WiFi.softAPIP());
        return true;
    }
    return false;
}
