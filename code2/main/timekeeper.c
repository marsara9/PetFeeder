#include "timekeeper.h"

#include <stdlib.h>

#include "esp_err.h"
#include "esp_log.h"
#include "esp_netif_sntp.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

static const char *TAG = "timekeeper";
static volatile bool synchronized;

static void sync_task(void *context)
{
    (void)context;
    while (true) {
        esp_err_t result = esp_netif_sntp_sync_wait(pdMS_TO_TICKS(1000));
        if (result == ESP_OK) {
            synchronized = true;
            time_t now = timekeeper_now();
            struct tm local_time;
            localtime_r(&now, &local_time);
            ESP_LOGI(TAG, "Time synchronized: %04d-%02d-%02d %02d:%02d:%02d", local_time.tm_year + 1900, local_time.tm_mon + 1, local_time.tm_mday, local_time.tm_hour, local_time.tm_min, local_time.tm_sec);
            vTaskDelete(NULL);
        }
    }
}

bool timekeeper_start(void)
{
    setenv("TZ", "UTC0", 1);
    tzset();

    esp_sntp_config_t config = ESP_NETIF_SNTP_DEFAULT_CONFIG("pool.ntp.org");
    config.wait_for_sync = true;
    esp_err_t result = esp_netif_sntp_init(&config);
    if (result != ESP_OK) {
        ESP_LOGE(TAG, "Could not initialize SNTP: %s", esp_err_to_name(result));
        return false;
    }

    BaseType_t task_result = xTaskCreate(sync_task, "time_sync", 3072, NULL, 4, NULL);
    if (task_result != pdPASS) {
        ESP_LOGE(TAG, "Could not create time synchronization task");
        esp_netif_sntp_deinit();
        return false;
    }

    ESP_LOGI(TAG, "SNTP started; firmware time is UTC");
    return true;
}

bool timekeeper_is_synchronized(void)
{
    return synchronized;
}

time_t timekeeper_now(void)
{
    time_t now;
    time(&now);
    return now;
}

bool timekeeper_next(int hour, int minute, time_t *result)
{
    if (result == NULL || hour < 0 || hour > 23 || minute < 0 || minute > 59 || !timekeeper_is_synchronized()) {
        return false;
    }

    time_t now = timekeeper_now();
    struct tm local_time;
    localtime_r(&now, &local_time);
    local_time.tm_hour = hour;
    local_time.tm_min = minute;
    local_time.tm_sec = 0;

    time_t next = mktime(&local_time);
    if (next <= now) {
        local_time.tm_mday++;
        next = mktime(&local_time);
    }

    *result = next;
    return true;
}
