#include "webserver.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cJSON.h"
#include "esp_http_server.h"
#include "esp_log.h"
#include "esp_random.h"

#define HTTP_PORT 80
#define QUERY_BUFFER_SIZE 256
#define MAX_HTTP_SCHEDULES MAX_SCHEDULES

static const char *TAG = "webserver";
static const char *JSON_CONTENT_TYPE = "application/json";
static const char *NOT_FOUND_RESPONSE = "{\"error\":{\"code\":404,\"message\":\"Not Found\"}}";
static const char *INVALID_REQUEST_RESPONSE = "{\"error\":{\"code\":400,\"message\":\"Invalid request\"}}";
static const char *SAVE_FAILED_RESPONSE = "{\"error\":{\"code\":503,\"message\":\"Unable to save settings\"}}";

static httpd_handle_t server;
static WifiCredentials current_credentials;
static webserver_save_credentials_fn save_credentials;
static webserver_get_schedules_fn get_schedules;
static webserver_save_schedule_fn save_schedule;
static webserver_delete_schedule_fn delete_schedule;

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

static bool is_uuid(const char *id)
{
    if (strlen(id) != 36) {
        return false;
    }
    for (size_t index = 0; index < 36; index++) {
        if (index == 8 || index == 13 || index == 18 || index == 23) {
            if (id[index] != '-') {
                return false;
            }
        } else if (!((id[index] >= '0' && id[index] <= '9') || (id[index] >= 'a' && id[index] <= 'f') || (id[index] >= 'A' && id[index] <= 'F'))) {
            return false;
        }
    }
    return true;
}

static bool get_schedule_id(httpd_req_t *request, char *id, size_t id_size)
{
    const char *prefix = "/schedule/";
    if (strncmp(request->uri, prefix, strlen(prefix)) != 0) {
        return false;
    }

    const char *start = request->uri + strlen(prefix);
    const char *query = strchr(start, '?');
    size_t length = query == NULL ? strlen(start) : (size_t)(query - start);
    if (length == 0 || length >= id_size) {
        return false;
    }

    memcpy(id, start, length);
    id[length] = '\0';
    return is_uuid(id);
}

static esp_err_t handle_get_schedules(httpd_req_t *request)
{
    Schedule schedules[MAX_HTTP_SCHEDULES];
    size_t count = 0;
    if (get_schedules == NULL || !get_schedules(schedules, MAX_HTTP_SCHEDULES, &count)) {
        return send_json(request, 503, SAVE_FAILED_RESPONSE);
    }

    cJSON *response_array = cJSON_CreateArray();
    if (response_array == NULL) {
        return send_json(request, 500, "{\"error\":{\"code\":500,\"message\":\"Out of memory\"}}");
    }

    for (size_t index = 0; index < count; index++) {
        cJSON *schedule = cJSON_CreateObject();
        cJSON_AddStringToObject(schedule, "id", schedules[index].id);
        cJSON_AddNumberToObject(schedule, "cups", schedules[index].cups);
        char time[9];
        snprintf(time, sizeof(time), "%u:%02u", schedules[index].hour, schedules[index].minute);
        cJSON_AddStringToObject(schedule, "time", time);
        cJSON_AddItemToArray(response_array, schedule);
    }

    char *response = cJSON_PrintUnformatted(response_array);
    cJSON_Delete(response_array);
    if (response == NULL) {
        return send_json(request, 500, "{\"error\":{\"code\":500,\"message\":\"Unable to create response\"}}");
    }

    esp_err_t result = send_json(request, 200, response);
    free(response);
    return result;
}

static esp_err_t handle_put_schedule(httpd_req_t *request)
{
    char value[QUERY_BUFFER_SIZE];
    char id[SCHEDULE_ID_MAX_LENGTH];
    if (!get_schedule_id(request, id, sizeof(id))) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }
    if (!get_query_value(request, "cups", value, sizeof(value))) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    char *end = NULL;
    float cups = strtof(value, &end);
    if (end == value || *end != '\0' || cups <= 0.0f) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    if (!get_query_value(request, "time", value, sizeof(value))) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    char *separator = strchr(value, ':');
    if (separator == NULL || separator == value || separator[1] == '\0') {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }
    *separator = '\0';
    char *hour_end = NULL;
    char *minute_end = NULL;
    unsigned long hour = strtoul(value, &hour_end, 10);
    unsigned long minute = strtoul(separator + 1, &minute_end, 10);
    if (hour_end == value || *hour_end != '\0' || minute_end == separator + 1 || *minute_end != '\0' || hour > 23 || minute > 59) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    Schedule schedule = {0};
    strncpy(schedule.id, id, sizeof(schedule.id) - 1);
    schedule.cups = cups;
    schedule.hour = (uint8_t)hour;
    schedule.minute = (uint8_t)minute;
    if (save_schedule == NULL || !save_schedule(&schedule)) {
        return send_json(request, 503, SAVE_FAILED_RESPONSE);
    }

    httpd_resp_set_status(request, "204 No Content");
    return httpd_resp_send(request, NULL, 0);
}

static esp_err_t handle_delete_schedule(httpd_req_t *request)
{
    char id[SCHEDULE_ID_MAX_LENGTH];
    if (!get_schedule_id(request, id, sizeof(id))) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    if (delete_schedule == NULL || !delete_schedule(id)) {
        return send_json(request, 503, SAVE_FAILED_RESPONSE);
    }

    httpd_resp_set_status(request, "204 No Content");
    return httpd_resp_send(request, NULL, 0);
}

bool webserver_start(
    const WifiCredentials *credentials,
    webserver_save_credentials_fn save_callback,
    webserver_get_schedules_fn get_schedules_callback,
    webserver_save_schedule_fn save_schedule_callback,
    webserver_delete_schedule_fn delete_schedule_callback)
{
    if (credentials == NULL || save_callback == NULL || get_schedules_callback == NULL || save_schedule_callback == NULL || delete_schedule_callback == NULL) {
        return false;
    }

    current_credentials = *credentials;
    save_credentials = save_callback;
    get_schedules = get_schedules_callback;
    save_schedule = save_schedule_callback;
    delete_schedule = delete_schedule_callback;

    httpd_config_t config = HTTPD_DEFAULT_CONFIG();
    config.server_port = HTTP_PORT;
    config.max_uri_handlers = 8;
    config.uri_match_fn = httpd_uri_match_wildcard;

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
    httpd_uri_t get_schedules_uri = {
        .uri = "/schedule",
        .method = HTTP_GET,
        .handler = handle_get_schedules,
        .user_ctx = NULL,
    };
    httpd_uri_t put_schedule_uri = {
        .uri = "/schedule/*",
        .method = HTTP_PUT,
        .handler = handle_put_schedule,
        .user_ctx = NULL,
    };
    httpd_uri_t delete_schedule_uri = {
        .uri = "/schedule/*",
        .method = HTTP_DELETE,
        .handler = handle_delete_schedule,
        .user_ctx = NULL,
    };
    httpd_register_uri_handler(server, &get_schedules_uri);
    httpd_register_uri_handler(server, &put_schedule_uri);
    httpd_register_uri_handler(server, &delete_schedule_uri);
    httpd_register_err_handler(server, HTTPD_404_NOT_FOUND, handle_not_found);

    ESP_LOGI(TAG, "HTTP server listening on port %d", HTTP_PORT);
    return true;
}
