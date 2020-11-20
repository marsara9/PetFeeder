#include "WebServerManager.h"
#include "jsonUtils.h"

#ifdef ARDUINO_ARCH_ESP32

#include <WebServer.h>
#include <uri/UriBraces.h>

#else

#include <uri/UriBraces.h>
#include <ESP8266WebServer.h>

#endif

#include <string>
#include <math.h>

#ifdef ARDUINO_ARCH_ESP32
WebServer *server = nullptr;
#else
ESP8266WebServer *server = nullptr;
#endif


std::function<Settings()> onGetSettingsCallback;
std::function<void(Settings)> onSettingsChangedCallback;

std::function<std::vector<Feeding>()> onGetFeedingsCallback;
std::function<void(Feeding)> onFeedCallback;
std::function<bool(float)> isValidFeedAmountCallback;

std::function<std::vector<Schedule>()> onGetAllScheduledFeedingsCallback;
std::function<void(Schedule)> onAddScheduledFeedingCallback;
std::function<void(std::string)> onDeleteScheduledFeedingCallback;

std::function<void(Registration)> onRegisterDeviceCallback;
std::function<void(std::string)> onDeleteRegistrationCallback;

const char* CONTENT_TYPE = "application/json";

const int HTTP_OK = 200;
const int HTTP_CREATED = 201;
const int HTTP_NO_CONTENT = 204;
const int HTTP_BAD_REQUEST = 400;
const int HTTP_NOT_FOUND = 404;

WebServerManager::WebServerManager(int port, TimeKeeper* timeKeeper) {
#ifdef ARDUINO_ARCH_ESP32
    server = new WebServer(port);
#else
    server = new ESP8266WebServer(port);
#endif
    this->timeKeeper = timeKeeper;
}

void WebServerManager::startServer() {
    server->stop();
    server->begin();

    server->onNotFound(std::bind(&WebServerManager::handleNotFound, this));
    server->on("/settings", HTTP_GET, std::bind(&WebServerManager::handleGETSettings, this));
    server->on("/settings", HTTP_PUT, std::bind(&WebServerManager::handlePUTSettings, this));

    server->on("/feed", HTTP_GET, std::bind(&WebServerManager::handleGETFeed, this));
    server->on("/feed", HTTP_POST, std::bind(&WebServerManager::handlePOSTFeed, this));

    server->on("/schedule", HTTP_GET, std::bind(&WebServerManager::handleGETSchedules, this));
    server->on("/schedule", HTTP_POST, std::bind(&WebServerManager::handlePOSTSchedule, this));
    server->on(UriBraces("/schedule/{}"), HTTP_DELETE, std::bind(&WebServerManager::handleDELETESchedule, this));

    server->on("/register", HTTP_POST, std::bind(&WebServerManager::handlePOSTRegister, this));
    server->on(UriBraces("/register/{}"), HTTP_DELETE, std::bind(&WebServerManager::handleDELETERegister, this));
}

void WebServerManager::handleClient() {
    server->handleClient();
}

void WebServerManager::onGetSettings(std::function<Settings()> callback) {
    onGetSettingsCallback = callback;
}

void WebServerManager::onSettingsChanged(std::function<void(Settings)> callback) {
    onSettingsChangedCallback = callback;
}

void WebServerManager::onGetFeedings(std::function<std::vector<Feeding>()> callback) {
    onGetFeedingsCallback = callback;
}

void WebServerManager::onFeed(std::function<void(Feeding)> callback) {
    onFeedCallback = callback;
}

void WebServerManager::isValidFeedAmount(std::function<bool(float)> callback) {
    isValidFeedAmountCallback = callback;
}

void WebServerManager::onGetAllScheduledFeedings(std::function<std::vector<Schedule>()> callback) {
    onGetAllScheduledFeedingsCallback = callback;
}

void WebServerManager::onAddScheduledFeeding(std::function<void(Schedule)> callback) {
    onAddScheduledFeedingCallback = callback;
}

void WebServerManager::onDeleteScheduledFeeding(std::function<void(std::string)> callback) {
    onDeleteScheduledFeedingCallback = callback;
}

void WebServerManager::onRegisterDevice(std::function<void(Registration)> callback) {
    onRegisterDeviceCallback = callback;
}

void WebServerManager::onDeleteRegistration(std::function<void(std::string)> callback) {
    onDeleteRegistrationCallback = callback;
}

void WebServerManager::printRequest() {
    Serial.print("REQUEST: ");
    Serial.print(server->method());
    Serial.print(" ");
    Serial.println(server->uri());
}

void WebServerManager::sendResponse(int code, const char* contentType = "", std::string response = "") {
    Serial.print("RESPONSE: ");
    Serial.print(code);
    Serial.print(" ");
    Serial.println(response.c_str());

    server->send(code, contentType, response.c_str());
}

void WebServerManager::handleNotFound() {
    sendResponse(HTTP_NOT_FOUND, CONTENT_TYPE, "{ \"error\" : { \"code\" : 404, \"message\" : \"Not Found\" } }");
}

void WebServerManager::handleGETSettings() {
    printRequest();

    Settings settings = onGetSettingsCallback();

    sendResponse(HTTP_OK, CONTENT_TYPE, settingsToJson(settings).c_str());
}

void WebServerManager::handlePUTSettings() {
    printRequest();

    const char* ssid = server->arg("ssid").c_str();
    const char* password = server->arg("password").c_str();
    const char* name = server->arg("name").c_str();
    const char* fcm = server->arg("fcm_fingerprint").c_str();

    sendResponse(HTTP_NO_CONTENT);

    delay(100);

    Settings settings = {
        .ssid = ssid,
        .password = password,
        .name = name
    };

    for(unsigned int i = 0; i < min<unsigned int>(strlen(fcm), sizeof(settings.fcm_fingerprint)*2); i+=2) {
        char byteString[] = { fcm[i], fcm[i+1] };
        uint8_t byte = (uint8_t) strtol(byteString, nullptr, 16);
        settings.fcm_fingerprint[i/2] = byte;
    }

    onSettingsChangedCallback(settings);
}

void WebServerManager::handleGETFeed() {
    printRequest();

    std::vector<Feeding> feedings = onGetFeedingsCallback();
    std::function<std::string(Feeding)> toJson = &feedingToJson;

    sendResponse(HTTP_OK, CONTENT_TYPE, toJsonArray(feedings, toJson));
}

void WebServerManager::handlePOSTFeed() {
    printRequest();

    const char* cupsString = server->arg("cups").c_str();
    if(strlen(cupsString) == 0) {
        sendResponse(HTTP_BAD_REQUEST);
        return;
    }

    float cups = atof(cupsString);
    if(cups < 0 || !isValidFeedAmountCallback(cups)) {
        sendResponse(HTTP_BAD_REQUEST);
        return;
    }

    time_t now = timeKeeper->now();

    Feeding feeding = {
        .id = createUUID(),
        .cups = cups,
        .date = now
    };

    sendResponse(HTTP_OK, CONTENT_TYPE, feedingToJson(feeding).c_str());

    onFeedCallback(feeding);
}

void WebServerManager::handleGETSchedules() {
    printRequest();

    std::vector<Schedule> scheduledFeedings = onGetAllScheduledFeedingsCallback();
    std::function<std::string(Schedule)> toJson = &scheduleToJson;

    sendResponse(HTTP_OK, CONTENT_TYPE, toJsonArray(scheduledFeedings, toJson));
}

void WebServerManager::handlePOSTSchedule() {
    printRequest();

    const char* cupsString = server->arg("cups").c_str();
    if(strlen(cupsString) == 0) {
        sendResponse(HTTP_BAD_REQUEST);
        return;
    }

    float cups = atof(cupsString);
    if(cups < 0 || !isValidFeedAmountCallback(cups)) {
        sendResponse(HTTP_BAD_REQUEST);
        return;
    }

    std::string timeString = server->arg("time").c_str();
    if(timeString.find(":") < 0) {
        sendResponse(HTTP_BAD_REQUEST);
        return;
    }
    int hour = atoi(timeString.substr(0, timeString.find(":")).c_str());
    int minute = atoi(timeString.substr(timeString.find(":") + 1).c_str());
    if((hour < 0 || hour > 23) || (minute < 0 || minute > 59)) {
        sendResponse(HTTP_BAD_REQUEST);
        return;
    }

    Schedule schedule = {
        .id = createUUID(),
        .cups = cups,
        .hour = (uint8_t)hour,
        .minute = (uint8_t)minute
    };

    sendResponse(HTTP_OK, CONTENT_TYPE, scheduleToJson(schedule));

    onAddScheduledFeedingCallback(schedule);
}

void WebServerManager::handleDELETESchedule() {
    printRequest();

    std::string id = server->pathArg(0).c_str();

    sendResponse(HTTP_NO_CONTENT, CONTENT_TYPE);

    onDeleteScheduledFeedingCallback(id);
}

void WebServerManager::handlePOSTRegister() {
    printRequest();

    const char* json = server->arg("plain").c_str();

    Serial.print(json);

    onRegisterDeviceCallback(registrationFromJson(json));

    sendResponse(HTTP_NO_CONTENT, CONTENT_TYPE);
}

void WebServerManager::handleDELETERegister() {
    printRequest();

    std::string id = server->pathArg(0).c_str();

    sendResponse(HTTP_NO_CONTENT, CONTENT_TYPE);

    onDeleteRegistrationCallback(id);
}
