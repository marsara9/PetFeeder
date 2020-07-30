#include "wifi.h"

#include <sstream>
#include <ESP8266WiFi.h>
#include <ESP8266mDNS.h>

const int NUMBER_OF_CONNECTION_ATTEMPTS = 10;

WiFiConnection::WiFiConnection() {

    std::stringstream ss;
    ss << "petfeeder_" << random(9999);
    defaultName = ss.str();

    settings = {
        .ssid = "",
        .password = "",
        .name = ""
    };

    WiFi.mode(WIFI_STA);
    WiFi.setAutoConnect(true);
    WiFi.setAutoReconnect(true);
}

void WiFiConnection::begin(const Settings settings) {
    
    if(this->settings.ssid.compare(settings.ssid) != 0 || this->settings.password.compare(settings.password) != 0) {
        WiFi.disconnect(true);
        if(!settings.ssid.empty()) {
            delay(10);
            WiFi.begin(settings.ssid.c_str(), settings.password.c_str());

            Serial.print("Connecting to '");
            Serial.print(settings.ssid.c_str());
            Serial.println("'...");
        }
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
        delay(1000);

        WiFi.hostname(defaultName.c_str());
        if(MDNS.begin(defaultName.c_str()) && MDNS.addService("petfeeder", "tcp", 80)) {
            Serial.println("mDNS is running...");
        } else {
            Serial.println("mDNS failed.");
        }

    } else if(!WiFi.isConnected() && (WiFi.getMode() & WIFI_AP) == 0) {
        Serial.println("Setting up Access Point...");
        createAccessPoint();
    }

    MDNS.update();            
}

bool WiFiConnection::createAccessPoint() {
    if(WiFi.softAP(defaultName.c_str())) {
        Serial.print("\tSSID:\t");
        Serial.println(WiFi.softAPSSID());
        Serial.print("\tIP address:\t");
        Serial.println(WiFi.softAPIP());

        return true;
    } else {
        Serial.println("\tAccess Point setup failed.");
    }
    return false;
}
