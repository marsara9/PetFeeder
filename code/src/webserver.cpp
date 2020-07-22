#include "webserver.h"
#include "models/feeding.h"

#include <ESP8266WebServer.h>
#include <WiFiUDP.h>
#include <NTPClient.h>
#include <Time.h>

WiFiUDP ntpUDP;
NTPClient *timeClient = new NTPClient(ntpUDP);

ESP8266WebServer *server = nullptr;
Settings (*onGetSettingsCallback)();
void (*onSettingsChangedCallback)(Settings);
void (*onFeedCallback)(Feeding);
bool (*isValidFeedAmountCallback)(float);

const char* CONTENT_TYPE = "application/json";

const int HTTP_OK = 200;
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
    server->on("/feed", HTTP_POST, std::bind(&WebServer::handlePOSTFeed, this));
}

void WebServer::handleClient() {
    timeClient->update();

    server->handleClient();
}

void WebServer::onGetSettings(Settings callback()) {
    onGetSettingsCallback = callback;
}

void WebServer::onSettingsChanged(void callback(Settings)) {
    onSettingsChangedCallback = callback;
}

void WebServer::onFeed(void callback(Feeding)) {
    onFeedCallback = callback;
}

void WebServer::isValidFeedAmount(bool callback(float)) {
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

    std::string response = "{ \"ssid\" : \"" + std::string(settings.ssid) + "\", \"name\" : \"" + std::string(settings.name) + "\" }";

    server->send(HTTP_OK, CONTENT_TYPE, response.c_str());
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
        .id = "",
        .cups = cups,
        .date = now
    };

    char time_buf[21]; // YYYY-MM-DDTHH:mm:ssZ
    struct tm ts = *gmtime(&now);
    strftime(time_buf, sizeof(time_buf), "%FT%TZ", &ts);

    char cupsString2[6]; // 0.000
    snprintf(cupsString2, sizeof(cups), "%f", feeding.cups);

    std::string response = "{ \"id\" : \"" + feeding.id + "\", \"cups\" : " + cupsString2 + ", \"time\" : \"" + time_buf + "\" }";

    server->send(HTTP_OK, CONTENT_TYPE, response.c_str());

    onFeedCallback(feeding);
}