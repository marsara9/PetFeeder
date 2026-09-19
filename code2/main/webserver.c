#include "webserver.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cJSON.h"
#include "esp_http_server.h"
#include "esp_log.h"

#define HTTP_PORT 80
#define QUERY_BUFFER_SIZE 256

static const char *TAG = "webserver";
static const char *JSON_CONTENT_TYPE = "application/json";
static const char *NOT_FOUND_RESPONSE = "{\"error\":{\"code\":404,\"message\":\"Not Found\"}}";
static const char *INVALID_REQUEST_RESPONSE = "{\"error\":{\"code\":400,\"message\":\"Invalid request\"}}";
static const char *SAVE_FAILED_RESPONSE = "{\"error\":{\"code\":503,\"message\":\"Unable to save settings\"}}";

static httpd_handle_t server;
static WifiCredentials current_credentials;
static webserver_save_credentials_fn save_credentials;

static esp_err_t send_json(httpd_req_t *request, int status_code, const char *body)
{
    char status[16];
    snprintf(status, sizeof(status), "%d", status_code);
    httpd_resp_set_status(request, status);
    httpd_resp_set_type(request, JSON_CONTENT_TYPE);
    return httpd_resp_send(request, body, HTTPD_RESP_USE_STRLEN);
}

static esp_err_t handle_not_found(httpd_req_t *request, httpd_err_code_t error_code)
{
    (void)error_code;
    return send_json(request, 404, NOT_FOUND_RESPONSE);
}

static esp_err_t handle_get_settings(httpd_req_t *request)
{
    cJSON *settings = cJSON_CreateObject();
    if (settings == NULL) {
        return send_json(request, 500, "{\"error\":{\"code\":500,\"message\":\"Out of memory\"}}");
    }

    cJSON_AddStringToObject(settings, "ssid", current_credentials.ssid);
    char *response = cJSON_PrintUnformatted(settings);
    cJSON_Delete(settings);
    if (response == NULL) {
        return send_json(request, 500, "{\"error\":{\"code\":500,\"message\":\"Unable to create response\"}}");
    }

    esp_err_t result = send_json(request, 200, response);
    free(response);
    return result;
}

static bool get_query_value(httpd_req_t *request, const char *key, char *value, size_t value_size)
{
    size_t query_length = httpd_req_get_url_query_len(request);
    if (query_length == 0 || query_length >= QUERY_BUFFER_SIZE) {
        return false;
    }

    char query[QUERY_BUFFER_SIZE];
    if (httpd_req_get_url_query_str(request, query, sizeof(query)) != ESP_OK) {
        return false;
    }

    return httpd_query_key_value(query, key, value, value_size) == ESP_OK;
}

static esp_err_t handle_put_settings(httpd_req_t *request)
{
    WifiCredentials updated = current_credentials;
    char value[WIFI_CREDENTIAL_MAX_LENGTH];
    bool has_update = false;

    if (get_query_value(request, "ssid", value, sizeof(value))) {
        strncpy(updated.ssid, value, sizeof(updated.ssid) - 1);
        updated.ssid[sizeof(updated.ssid) - 1] = '\0';
        has_update = true;
    }
    if (get_query_value(request, "password", value, sizeof(value))) {
        strncpy(updated.password, value, sizeof(updated.password) - 1);
        updated.password[sizeof(updated.password) - 1] = '\0';
        has_update = true;
    }

    if (!has_update || save_credentials == NULL || !save_credentials(&updated)) {
        return send_json(request, has_update ? 503 : 400, has_update ? SAVE_FAILED_RESPONSE : INVALID_REQUEST_RESPONSE);
    }

    current_credentials = updated;
    ESP_LOGI(TAG, "Wi-Fi credentials saved for SSID '%s'", current_credentials.ssid);
    httpd_resp_set_status(request, "204 No Content");
    return httpd_resp_send(request, NULL, 0);
}

bool webserver_start(const WifiCredentials *credentials, webserver_save_credentials_fn save_callback)
{
    if (credentials == NULL || save_callback == NULL) {
        return false;
    }

    current_credentials = *credentials;
    save_credentials = save_callback;

    httpd_config_t config = HTTPD_DEFAULT_CONFIG();
    config.server_port = HTTP_PORT;
    config.max_uri_handlers = 8;

    if (httpd_start(&server, &config) != ESP_OK) {
        ESP_LOGE(TAG, "Could not start HTTP server");
        return false;
    }

    httpd_uri_t get_settings = {
        .uri = "/settings",
        .method = HTTP_GET,
        .handler = handle_get_settings,
        .user_ctx = NULL,
    };
    httpd_uri_t put_settings = {
        .uri = "/settings",
        .method = HTTP_PUT,
        .handler = handle_put_settings,
        .user_ctx = NULL,
    };
    httpd_register_uri_handler(server, &get_settings);
    httpd_register_uri_handler(server, &put_settings);
    httpd_register_err_handler(server, HTTPD_404_NOT_FOUND, handle_not_found);

    ESP_LOGI(TAG, "HTTP server listening on port %d", HTTP_PORT);
    return true;
}


