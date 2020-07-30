
#include "notifications.h"
#include "models/feeding.h"
#include "models/settings.h"

#include <ESP8266HTTPClient.h>
#include <WiFiClientSecureBearSSL.h>
#include <stdio.h>
#include <sstream>

// {
//     "to":"<device token>",
//     "notification" : {
//         "body" :  "test body",
//         "title" : "test title"
//     }
// }

const char* url = "https://fcm.googleapis.com/fcm/send";
std::function<std::vector<Registration>()> onGetAllRegisteredDevicesCallback;
const uint8_t fingerprint[20] = {0x41, 0x2a, 0x92, 0xb9, 0x66, 0x42, 0x21, 0xd6, 0xc9, 0x91, 0x39, 0x39, 0xc6, 0x03, 0x5b, 0x1d, 0x93, 0x0e, 0x0c, 0x50};

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

    std::string payload = "{ \"to\": \"" + token + "\", \"notification\": { \"body\": \"" + message + "\", \"title\": \"PetFeeder\" } }";

    HTTPClient http;
    BearSSL::WiFiClientSecure client;

    client.setFingerprint(fingerprint);

    Serial.print("REQUEST: ");
    Serial.print("POST");
    Serial.print(" ");
    Serial.println(url);
    Serial.print("\t");
    Serial.println(payload.c_str());

    http.begin(client, url);
    http.addHeader("Authorization", ("key=" + authorizationKey).c_str());
    http.addHeader("Content-Type", "application/json");

    int code = http.POST(payload.c_str());

    Serial.print("RESPONSE: ");
    Serial.print(code);
    if(code > 0) {

        const char* response = http.getString().c_str();

        Serial.print(" ");
        Serial.println(response);
    } else {
        Serial.println(http.errorToString(code));
    }
    http.end();

    
}
