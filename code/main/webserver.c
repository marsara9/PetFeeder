#include "webserver.h"

#include <ctype.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "cJSON.h"
#include "esp_http_server.h"
#include "esp_log.h"
#include "esp_random.h"

#define HTTP_PORT 80
#define QUERY_BUFFER_SIZE 256
#define MAX_HTTP_SCHEDULES MAX_SCHEDULES
#define MAX_HTTP_FEEDINGS DATASTORE_MAX_FEEDINGS

static const char *TAG = "webserver";
static const char *JSON_CONTENT_TYPE = "application/json";
static const char *NOT_FOUND_RESPONSE = "{\"error\":{\"code\":404,\"message\":\"Not Found\"}}";
static const char *INVALID_REQUEST_RESPONSE = "{\"error\":{\"code\":400,\"message\":\"Invalid request\"}}";
static const char *SAVE_FAILED_RESPONSE = "{\"error\":{\"code\":503,\"message\":\"Unable to save settings\"}}";
static const char *HISTORY_FAILED_RESPONSE = "{\"error\":{\"code\":503,\"message\":\"Unable to read feeding history\"}}";

static httpd_handle_t server;
static WifiCredentials current_credentials;
static webserver_save_credentials_fn save_credentials;
static webserver_get_schedules_fn get_schedules;
static webserver_save_schedule_fn save_schedule;
static webserver_delete_schedule_fn delete_schedule;
static webserver_get_feedings_fn get_feedings;
static webserver_feed_fn feed;
static Feeding feeding_history[MAX_HTTP_FEEDINGS];
static Schedule schedule_history[MAX_HTTP_SCHEDULES];

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
    cJSON_AddStringToObject(settings, "hostname", current_credentials.hostname);
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
    if (get_query_value(request, "hostname", value, sizeof(value))) {
        strncpy(updated.hostname, value, sizeof(updated.hostname) - 1);
        updated.hostname[sizeof(updated.hostname) - 1] = '\0';
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
    size_t count = 0;
    if (get_schedules == NULL || !get_schedules(schedule_history, MAX_HTTP_SCHEDULES, &count)) {
        return send_json(request, 503, SAVE_FAILED_RESPONSE);
    }

    cJSON *response_array = cJSON_CreateArray();
    if (response_array == NULL) {
        return send_json(request, 500, "{\"error\":{\"code\":500,\"message\":\"Out of memory\"}}");
    }

    for (size_t index = 0; index < count; index++) {
        cJSON *schedule = cJSON_CreateObject();
        cJSON_AddStringToObject(schedule, "id", schedule_history[index].id);
        cJSON_AddNumberToObject(schedule, "cups", schedule_history[index].cups);
        char time[9];
        snprintf(time, sizeof(time), "%u:%02u", schedule_history[index].hour, schedule_history[index].minute);
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

static esp_err_t handle_get_feedings(httpd_req_t *request)
{
    size_t count = 0;
    if (get_feedings == NULL || !get_feedings(feeding_history, MAX_HTTP_FEEDINGS, &count)) {
        return send_json(request, 503, HISTORY_FAILED_RESPONSE);
    }

    cJSON *response_array = cJSON_CreateArray();
    if (response_array == NULL) {
        return send_json(request, 500, "{\"error\":{\"code\":500,\"message\":\"Out of memory\"}}");
    }

    for (size_t index = 0; index < count; index++) {
        cJSON *feeding = cJSON_CreateObject();
        char date[21];
        struct tm utc_time;
        gmtime_r(&feeding_history[index].date, &utc_time);
        strftime(date, sizeof(date), "%Y-%m-%dT%H:%M:%SZ", &utc_time);
        cJSON_AddStringToObject(feeding, "id", feeding_history[index].id);
        cJSON_AddNumberToObject(feeding, "cups", feeding_history[index].cups);
        cJSON_AddStringToObject(feeding, "date", date);
        cJSON_AddItemToArray(response_array, feeding);
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

// cups is only accurate to the nearest 1/8 cup the motor can dispense
static bool is_valid_cups(float cups)
{
    if (!isfinite(cups) || cups < FEEDING_MINIMUM_CUPS) {
        return false;
    }
    float remainder = fmodf(cups, FEEDING_MINIMUM_CUPS);
    return remainder <= 0.0001f || FEEDING_MINIMUM_CUPS - remainder <= 0.0001f;
}

// strict zero-padded 24-hour HH:MM; anything else is ambiguous
static bool parse_strict_time(const char *value, uint8_t *hour_out, uint8_t *minute_out)
{
    if (strlen(value) != 5 || value[2] != ':') {
        return false;
    }
    if (!isdigit((unsigned char)value[0]) || !isdigit((unsigned char)value[1]) ||
        !isdigit((unsigned char)value[3]) || !isdigit((unsigned char)value[4])) {
        return false;
    }

    unsigned hour = (unsigned)((value[0] - '0') * 10 + (value[1] - '0'));
    unsigned minute = (unsigned)((value[3] - '0') * 10 + (value[4] - '0'));
    if (hour > 23 || minute > 59) {
        return false;
    }

    *hour_out = (uint8_t)hour;
    *minute_out = (uint8_t)minute;
    return true;
}

static esp_err_t handle_post_feed(httpd_req_t *request)
{
    char value[QUERY_BUFFER_SIZE];
    if (!get_query_value(request, "cups", value, sizeof(value))) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    char *end = NULL;
    float cups = strtof(value, &end);
    if (end == value || *end != '\0' || !is_valid_cups(cups)) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    Feeding feeding = {0};
    if (feed == NULL || !feed(cups, &feeding)) {
        return send_json(request, 503, SAVE_FAILED_RESPONSE);
    }

    cJSON *response_object = cJSON_CreateObject();
    if (response_object == NULL) {
        return send_json(request, 500, "{\"error\":{\"code\":500,\"message\":\"Out of memory\"}}");
    }
    char date[21];
    struct tm utc_time;
    gmtime_r(&feeding.date, &utc_time);
    strftime(date, sizeof(date), "%Y-%m-%dT%H:%M:%SZ", &utc_time);
    cJSON_AddStringToObject(response_object, "id", feeding.id);
    cJSON_AddNumberToObject(response_object, "cups", feeding.cups);
    cJSON_AddStringToObject(response_object, "date", date);
    char *response = cJSON_PrintUnformatted(response_object);
    cJSON_Delete(response_object);
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
    if (end == value || *end != '\0' || !is_valid_cups(cups)) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    if (!get_query_value(request, "time", value, sizeof(value))) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    uint8_t hour = 0;
    uint8_t minute = 0;
    if (!parse_strict_time(value, &hour, &minute)) {
        return send_json(request, 400, INVALID_REQUEST_RESPONSE);
    }

    Schedule schedule = {0};
    strncpy(schedule.id, id, sizeof(schedule.id) - 1);
    schedule.cups = cups;
    schedule.hour = hour;
    schedule.minute = minute;
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
    webserver_delete_schedule_fn delete_schedule_callback,
    webserver_get_feedings_fn get_feedings_callback,
    webserver_feed_fn feed_callback)
{
    if (credentials == NULL || save_callback == NULL || get_schedules_callback == NULL || save_schedule_callback == NULL || delete_schedule_callback == NULL || get_feedings_callback == NULL || feed_callback == NULL) {
        return false;
    }

    current_credentials = *credentials;
    save_credentials = save_callback;
    get_schedules = get_schedules_callback;
    save_schedule = save_schedule_callback;
    delete_schedule = delete_schedule_callback;
    get_feedings = get_feedings_callback;
    feed = feed_callback;

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
    httpd_uri_t get_feedings_uri = {
        .uri = "/feed",
        .method = HTTP_GET,
        .handler = handle_get_feedings,
        .user_ctx = NULL,
    };
    httpd_register_uri_handler(server, &get_feedings_uri);
    httpd_uri_t post_feed_uri = {
        .uri = "/feed",
        .method = HTTP_POST,
        .handler = handle_post_feed,
        .user_ctx = NULL,
    };
    httpd_register_uri_handler(server, &post_feed_uri);
    httpd_register_err_handler(server, HTTPD_404_NOT_FOUND, handle_not_found);

    ESP_LOGI(TAG, "HTTP server listening on port %d", HTTP_PORT);
    return true;
}
