#include "wifi.h"

#include <stdbool.h>
#include <string.h>

#include "esp_event.h"
#include "esp_log.h"
#include "esp_netif.h"
#include "esp_wifi.h"
#include "freertos/FreeRTOS.h"
#include "freertos/event_groups.h"
#include "freertos/task.h"
#include "nvs_flash.h"

#define WIFI_CONNECT_TIMEOUT_MS 15000
#define WIFI_MAX_RETRIES 10
#define WIFI_AP_SSID "PetFeeder-Setup"
#define WIFI_AP_CHANNEL 1
#define WIFI_AP_MAX_CONNECTIONS 2

#define WIFI_CONNECTED_BIT BIT0
#define WIFI_FAILED_BIT BIT1

static const char *TAG = "wifi";
static EventGroupHandle_t wifi_event_group;
static int retry_count;
static bool station_active;
static WifiCredentials station_credentials;

static void start_access_point(void)
{
    wifi_config_t ap_config = {
        .ap = {
            .ssid = WIFI_AP_SSID,
            .ssid_len = sizeof(WIFI_AP_SSID) - 1,
            .channel = WIFI_AP_CHANNEL,
            .authmode = WIFI_AUTH_OPEN,
            .max_connection = WIFI_AP_MAX_CONNECTIONS,
        },
    };

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_AP));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_AP, &ap_config));
    ESP_ERROR_CHECK(esp_wifi_start());

    esp_netif_ip_info_t ip_info;
    esp_netif_get_ip_info(esp_netif_get_handle_from_ifkey("WIFI_AP_DEF"), &ip_info);
    ESP_LOGI(TAG, "Access point started: %s", WIFI_AP_SSID);
    ESP_LOGI(TAG, "Connect to http://" IPSTR, IP2STR(&ip_info.ip));
}

static void wifi_event_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data)
{
    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        ESP_LOGI(TAG, "Connecting to '%s'", station_credentials.ssid);
    } else if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        wifi_event_sta_disconnected_t *event = (wifi_event_sta_disconnected_t *)event_data;
        if (!station_active) {
            ESP_LOGI(TAG, "Station stopped; ignoring disconnect reason=%d", event->reason);
            return;
        }

        if (retry_count < WIFI_MAX_RETRIES) {
            retry_count++;
            ESP_LOGW(
                TAG,
                "Station connection failed, reason=%d, retry %d/%d",
                event->reason,
                retry_count,
                WIFI_MAX_RETRIES);
            esp_err_t result = esp_wifi_connect();
            if (result != ESP_OK) {
                ESP_LOGW(TAG, "Retry could not start: %s", esp_err_to_name(result));
            }
        } else {
            ESP_LOGE(TAG, "Station authentication/connection failed, reason=%d", event->reason);
            xEventGroupSetBits(wifi_event_group, WIFI_FAILED_BIT);
        }
    } else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t *event = (ip_event_got_ip_t *)event_data;
        retry_count = 0;
        ESP_LOGI(TAG, "Connected, IP address: " IPSTR, IP2STR(&event->ip_info.ip));
        xEventGroupSetBits(wifi_event_group, WIFI_CONNECTED_BIT);
    }
}

void wifi_start(const WifiCredentials *credentials)
{
    if (credentials != NULL) {
        station_credentials = *credentials;
    } else {
        memset(&station_credentials, 0, sizeof(station_credentials));
    }
    esp_err_t nvs_result = nvs_flash_init();
    if (nvs_result == ESP_ERR_NVS_NO_FREE_PAGES || nvs_result == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        nvs_result = nvs_flash_init();
    }
    ESP_ERROR_CHECK(nvs_result);

    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());
    wifi_event_group = xEventGroupCreate();

    esp_netif_create_default_wifi_sta();
    esp_netif_create_default_wifi_ap();

    wifi_init_config_t wifi_init_config = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&wifi_init_config));
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL));
    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_event_handler, NULL));

    if (station_credentials.ssid[0] == '\0') {
        ESP_LOGI(TAG, "No station credentials configured");
        start_access_point();
        return;
    }

    wifi_config_t station_config = {0};
    memcpy(station_config.sta.ssid, station_credentials.ssid, strlen(station_credentials.ssid));
    memcpy(station_config.sta.password, station_credentials.password, strlen(station_credentials.password));
    station_config.sta.scan_method = WIFI_ALL_CHANNEL_SCAN;
    station_config.sta.sort_method = WIFI_CONNECT_AP_BY_SIGNAL;
    station_config.sta.threshold.authmode = WIFI_AUTH_WPA2_PSK;
    station_config.sta.pmf_cfg.capable = false;
    station_config.sta.pmf_cfg.required = false;

    ESP_ERROR_CHECK(esp_wifi_set_storage(WIFI_STORAGE_RAM));
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &station_config));
    ESP_LOGI(
        TAG,
        "Using SSID length=%u, password length=%u",
        (unsigned)strlen(station_credentials.ssid),
        (unsigned)strlen(station_credentials.password));
    station_active = true;
    ESP_ERROR_CHECK(esp_wifi_start());
    ESP_ERROR_CHECK(esp_wifi_connect());

    EventBits_t result = xEventGroupWaitBits(
        wifi_event_group,
        WIFI_CONNECTED_BIT | WIFI_FAILED_BIT,
        pdFALSE,
        pdFALSE,
        pdMS_TO_TICKS(WIFI_CONNECT_TIMEOUT_MS));

    if ((result & WIFI_CONNECTED_BIT) != 0) {
        return;
    }

    ESP_LOGW(TAG, "Station connection timed out; switching to access point");
    station_active = false;
    ESP_ERROR_CHECK(esp_wifi_stop());
    start_access_point();
}