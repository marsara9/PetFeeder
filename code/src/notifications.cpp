
#include "notifications.h"
#include "models/feeding.h"
#include "models/settings.h"

#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>
#include <stdio.h>
#include <sstream>

// {
//     "to":"<device token>",
//     "notification" : {
//         "body" :  "test body",
//         "title" : "test title"
//     }
// }

HTTPClient http;
const char* url = "https://fcm.googleapis.com/fcm/send";
std::function<std::vector<Registration>()> onGetAllRegisteredDevicesCallback;

Notifications::Notifications() {

}

void Notifications::begin(std::string authorizationKey) {
    this->authorizationKey = authorizationKey;
}

void Notifications::onGetAllRegisteredDevices(std::function<std::vector<Registration>()> callback) {
    onGetAllRegisteredDevicesCallback = callback;
}

void Notifications::send(Settings settings, Feeding feeding) {

    std::vector<Registration> devices = onGetAllRegisteredDevicesCallback();

    std::string message = createNotification(settings, feeding);

    Serial.println("Sending Notifications...");
    for(const auto &device : devices) {
        if(device.deviceType == "Android") {
            sendFCMNotification(device.token, message);
        }
    }
}

std::string Notifications::createNotification(Settings settings, Feeding feeding) {
    char result[4096];

    snprintf(result, sizeof(result), "%s dispensed %.3f cups of food.", settings.name.c_str(), feeding.cups);

    return std::string(result);
}

void Notifications::sendFCMNotification(std::string token, std::string message) {
    std::stringstream ss;
    ss << "{";
    ss << "\"to\": \"" << token << "\",";
    ss << "\"notification\": {";
    ss << "\"body\": \"" << message << "\",";
    ss << "\"title\": \"PetFeeder\",";
    ss << "}";
    ss << "}";

    const char* payload = ss.str().c_str();

    WiFiClient client;

    http.begin(client, url);
    http.addHeader("Authorization", ("key=" + authorizationKey).c_str());
    http.addHeader("Content-Type", "application/json");
    int code = http.POST(payload);
    const char* response = http.getString().c_str();
    http.end();

    Serial.print("REQUEST: ");
    Serial.print("POST");
    Serial.print(" ");
    Serial.println(url);
    Serial.println(payload);

    Serial.print("RESPONSE: ");
    Serial.print(code);
    Serial.print(" ");
    Serial.println(response);
}
