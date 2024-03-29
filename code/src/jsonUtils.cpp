#include "jsonUtils.h"

#include <time.h>
#include <stdio.h>
#include <sstream>
#include <Arduino.h>
#include <ArduinoJson.h>

std::string feedingToJson(Feeding feeding) {

    char time_buf[21]; // YYYY-MM-DDTHH:mm:ssZ
    struct tm ts = *gmtime(&feeding.date);
    strftime(time_buf, sizeof(time_buf), "%FT%TZ", &ts);

    char cupsString[6]; // 0.000
    snprintf(cupsString, sizeof(cupsString), "%.3f", feeding.cups);

    return "{ \"id\" : \"" + feeding.id + "\", \"cups\" : " + cupsString + ", \"date\" : \"" + time_buf + "\" }";
}

std::string scheduleToJson(Schedule schedule) {

    char cupsString[6]; // 0.000
    snprintf(cupsString, sizeof(cupsString), "%.3f", schedule.cups);

    std::stringstream ss;
    ss << (int)schedule.hour << ":" << (int)schedule.minute;

    return "{ \"id\" : \"" + schedule.id + "\", \"cups\" : " + cupsString + ", \"time\" : \"" + ss.str() + "\" }";
}

std::string registrationToJson(Registration registration) {
    return "{ \"id\" : \"" + registration.id + "\", \"token\" : " + registration.token + ", \"deviceType\" : \"" +registration.deviceType + "\" }";
}

std::string settingsToJson(Settings settings) {
    return "{ \"ssid\" : \"" + settings.ssid + "\", \"name\" : \"" + settings.name + "\" }";
}

Registration registrationFromJson(std::string json) {

    StaticJsonDocument<512> jsonDocument;

    deserializeJson(jsonDocument, json.c_str());

    JsonObject parsed = jsonDocument.as<JsonObject>();

    std::string id = parsed["id"].as<const char*>();
    std::string token = parsed["token"].as<const char*>();
    std::string deviceType = parsed["deviceType"].as<const char*>();

    return Registration {
        .id = id,
        .token = token,
        .deviceType = deviceType
    };
}

std::string createUUID() {
    uint8_t bytes[16];
    for(int i = 0; i < 16; i++) {
        bytes[i] = (uint8_t)random(255);
    }
    bytes[6] &= 0x0F;// 0000_1111
    bytes[6] |= 0x40;// 0100_0000
    bytes[8] &= 0x3F;// 0011_1111
    bytes[8] |= 0x80;// 1000_0000

    char hexstr[37];
    int i;
    int h = 0;
    for (i = 0; i < 16; i++) {
        if(i == 4 || i == 6 || i == 8 || i == 10) {
            hexstr[i * 2 + h] = '-';
            h++;
        }
        sprintf(hexstr + i * 2 + h, "%02x", bytes[i]);
    }
    hexstr[36] = 0;

    return std::string(hexstr);
}
