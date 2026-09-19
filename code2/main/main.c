#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#include "driver/uart.h"
#include "esp_err.h"
#include "esp_log.h"
#include "esp_random.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

#include "datastore.h"
#include "scheduler.h"
#include "timekeeper.h"
#include "webserver.h"
#include "wifi.h"

#define UART_PORT UART_NUM_0
#define UART_BAUD_RATE 115200
#define UART_BUFFER_SIZE 256

typedef struct {
    bool active;
    Schedule schedule;
    scheduler_event_id_t event_id;
} RuntimeSchedule;

static const char *SCHEDULE_TAG = "feeding";
static RuntimeSchedule runtime_schedules[MAX_SCHEDULES];
static Schedule loaded_schedules[MAX_SCHEDULES];

static void create_uuid(char *id, size_t id_size)
{
    snprintf(id, id_size, "%08x-%04x-%04x-%04x-%012llx", (unsigned)esp_random(), (unsigned)(esp_random() & 0xffff), (unsigned)(esp_random() & 0xffff), (unsigned)(esp_random() & 0xffff), (unsigned long long)(((uint64_t)esp_random() << 32) | esp_random()));
}

static void log_scheduled_feeding(void *context)
{
    RuntimeSchedule *runtime_schedule = context;
    ESP_LOGI(
        SCHEDULE_TAG,
        "Scheduled event fired: id=%s cups=%.3f at %02u:%02u UTC",
        runtime_schedule->schedule.id,
        runtime_schedule->schedule.cups,
        runtime_schedule->schedule.hour,
        runtime_schedule->schedule.minute);

    Feeding feeding = {0};
    create_uuid(feeding.id, sizeof(feeding.id));
    feeding.cups = runtime_schedule->schedule.cups;
    feeding.date = timekeeper_now();
    if (!datastore_record_feeding(&feeding)) {
        ESP_LOGE(SCHEDULE_TAG, "Could not record scheduled feeding history");
    }
}

static RuntimeSchedule *find_runtime_schedule(const char *id)
{
    for (size_t index = 0; index < MAX_SCHEDULES; index++) {
        if (runtime_schedules[index].active && strcmp(runtime_schedules[index].schedule.id, id) == 0) {
            return &runtime_schedules[index];
        }
    }
    return NULL;
}

static bool activate_schedule(const Schedule *schedule)
{
    RuntimeSchedule *runtime_schedule = find_runtime_schedule(schedule->id);
    if (runtime_schedule == NULL) {
        for (size_t index = 0; index < MAX_SCHEDULES; index++) {
            if (!runtime_schedules[index].active) {
                runtime_schedule = &runtime_schedules[index];
                break;
            }
        }
    }
    if (runtime_schedule == NULL) {
        return false;
    }

    if (runtime_schedule->active) {
        scheduler_cancel(runtime_schedule->event_id);
    }
    runtime_schedule->schedule = *schedule;
    runtime_schedule->active = true;
    if (!scheduler_schedule_daily(
            schedule->hour,
            schedule->minute,
            log_scheduled_feeding,
            runtime_schedule,
            &runtime_schedule->event_id)) {
        runtime_schedule->active = false;
        return false;
    }

    ESP_LOGI(SCHEDULE_TAG, "Scheduled %s for %02u:%02u UTC", schedule->id, schedule->hour, schedule->minute);
    return true;
}

static bool save_schedule_and_activate(const Schedule *schedule)
{
    return datastore_write_schedule(schedule) && activate_schedule(schedule);
}

static bool delete_schedule_and_cancel(const char *id)
{
    if (!datastore_delete_schedule(id)) {
        return false;
    }

    RuntimeSchedule *runtime_schedule = find_runtime_schedule(id);
    if (runtime_schedule != NULL) {
        scheduler_cancel(runtime_schedule->event_id);
        runtime_schedule->active = false;
    }
    return true;
}

void app_main(void)
{
    const uart_config_t uart_config = {
        .baud_rate = UART_BAUD_RATE,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
        .source_clk = UART_SCLK_DEFAULT,
    };

    ESP_ERROR_CHECK(uart_driver_install(UART_PORT, UART_BUFFER_SIZE * 2, 0, 0, NULL, 0));
    ESP_ERROR_CHECK(uart_param_config(UART_PORT, &uart_config));
    ESP_ERROR_CHECK(uart_set_pin(
        UART_PORT,
        UART_PIN_NO_CHANGE,
        UART_PIN_NO_CHANGE,
        UART_PIN_NO_CHANGE,
        UART_PIN_NO_CHANGE));

    const char *message = "ESP32 UART echo ready at 115200 baud\\r\\n";
    uart_write_bytes(UART_PORT, message, strlen(message));

    WifiCredentials credentials = {0};
    if (!datastore_init() || !datastore_read_wifi_credentials(&credentials)) {
        const char *fallback_message = "Using provisioning access point; no Wi-Fi credentials found.\r\n";
        uart_write_bytes(UART_PORT, fallback_message, strlen(fallback_message));
    }

    wifi_start(&credentials);
    timekeeper_start();
    scheduler_start();

    size_t schedule_count = 0;
    if (datastore_get_schedules(loaded_schedules, MAX_SCHEDULES, &schedule_count)) {
        for (size_t index = 0; index < schedule_count; index++) {
            activate_schedule(&loaded_schedules[index]);
        }
    }

    webserver_start(
        &credentials,
        datastore_write_wifi_credentials,
        datastore_get_schedules,
        save_schedule_and_activate,
        delete_schedule_and_cancel,
        datastore_get_feedings);

    uint8_t buffer[UART_BUFFER_SIZE];
    while (true) {
        int length = uart_read_bytes(UART_PORT, buffer, sizeof(buffer), pdMS_TO_TICKS(100));
        if (length > 0) {
            uart_write_bytes(UART_PORT, (const char *)buffer, length);
        }
    }
}
