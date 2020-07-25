#include "webserver.h"
#include "models/feeding.h"
#include "models/schedule.h"
#include "models/settings.h"
#include "jsonUtils.h"

#include <ESP8266WebServer.h>
#include <WiFiUDP.h>
#include <NTPClient.h>

WiFiUDP ntpUDP;
NTPClient *timeClient = new NTPClient(ntpUDP);

ESP8266WebServer *server = nullptr;

std::function<Settings()> onGetSettingsCallback;
std::function<void(Settings)> onSettingsChangedCallback;
std::function<std::vector<Feeding>()> onGetFeedingsCallback;
std::function<void(Feeding)> onFeedCallback;
std::function<bool(float)> isValidFeedAmountCallback;

const char* CONTENT_TYPE = "application/json";

const int HTTP_OK = 200;
const int HTTP_CREATED = 201;
const int HTTP_NO_CONTENT = 204;
const int HTTP_BAD_REQUEST = 400;
const int HTTP_NOT_FOUND = 404;
const int HTTP_NOT_ACCEPTABLE = 406;

WebServer::WebServer(int port) {
    server = new ESP8266WebServer(port);
}

void WebServer::startServer() {
    timeClient->begin();

    server->stop();
    server->begin();

    server->onNotFound(std::bind(&WebServer::handleNotFound, this));
    server->on("/settings", HTTP_GET, std::bind(&WebServer::handleGETSettings, this));
    server->on("/settings", HTTP_PUT, std::bind(&WebServer::handlePUTSettings, this));
    server->on("/feed", HTTP_GET, std::bind(&WebServer::handleGETFeed, this));
    server->on("/feed", HTTP_POST, std::bind(&WebServer::handlePOSTFeed, this));
}

void WebServer::handleClient() {
    timeClient->update();

    server->handleClient();
}

void WebServer::onGetSettings(std::function<Settings()> callback) {
    onGetSettingsCallback = callback;
}

void WebServer::onSettingsChanged(std::function<void(Settings)> callback) {
    onSettingsChangedCallback = callback;
}

void WebServer::onGetFeedings(std::function<std::vector<Feeding>()> callback) {
    onGetFeedingsCallback = callback;
}

void WebServer::onFeed(std::function<void(Feeding)> callback) {
    onFeedCallback = callback;
}

void WebServer::isValidFeedAmount(std::function<bool(float)> callback) {
    isValidFeedAmountCallback = callback;
}

void printRequest() {
    Serial.print("REQUEST: ");
    Serial.print(server->method());
    Serial.print(" ");
    Serial.println(server->uri());
}

void WebServer::handleNotFound() {
    server->send(HTTP_NOT_FOUND, CONTENT_TYPE, "{ 'error' : { 'code' : 404, 'message' : 'Not Found' } }");
}

void WebServer::handleGETSettings() {
    printRequest();

    Settings settings = onGetSettingsCallback();

    server->send(HTTP_OK, CONTENT_TYPE, settingsToJson(settings).c_str());
}

void WebServer::handlePUTSettings() {
    printRequest();

    const char* ssid = server->arg("ssid").c_str();
    const char* password = server->arg("password").c_str();
    const char* name = server->arg("name").c_str();

    server->send(HTTP_NO_CONTENT);

    delay(100);

    onSettingsChangedCallback({
        .ssid = ssid,
        .password = password,
        .name = name
    });
}

void WebServer::handleGETFeed() {
    printRequest();

    std::vector<Feeding> feedings = onGetFeedingsCallback();

    std::vector<std::string> feedingsJson;
    for(size_t i = 0; i < feedings.size(); i++) {
        feedingsJson.push_back(feedingToJson(feedings.at(i)));
    }
    std::string response = std::accumulate(feedingsJson.begin(), feedingsJson.end(), std::string(""));

    server->send(HTTP_OK, response.c_str());
}

void WebServer::handlePOSTFeed() {
    printRequest();

    const char* cupsString = server->arg("cups").c_str();
    if(strlen(cupsString) == 0) {
        server->send(HTTP_BAD_REQUEST);
        return;
    }

    float cups = atof(cupsString);
    if(cups < 0 || !isValidFeedAmountCallback(cups)) {
        server->send(HTTP_NOT_ACCEPTABLE);
        return;
    }

    time_t now = timeClient->getEpochTime();
    //String id = ESPRandom::uuidToString(ESPRandom::uuid());

    Feeding feeding = {
        .id = "00000000-0000-0000-0000-000000000000",
        .cups = cups,
        .date = now
    };

    server->send(HTTP_OK, CONTENT_TYPE, feedingToJson(feeding).c_str());

    onFeedCallback(feeding);
}
