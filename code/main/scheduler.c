#include "scheduler.h"

#include <time.h>

#include "esp_log.h"
#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"
#include "freertos/task.h"

#include "timekeeper.h"

typedef struct {
    bool active;
    uint8_t hour;
    uint8_t minute;
    scheduler_event_fn event;
    void *context;
    scheduler_event_id_t id;
    int fired_year;
    int fired_yday;
} scheduled_event_t;

static const char *TAG = "scheduler";
static scheduled_event_t events[SCHEDULER_MAX_EVENTS];
static SemaphoreHandle_t events_lock;
static scheduler_event_id_t next_id = 1;

static void scheduler_task(void *context)
{
    (void)context;
    while (true) {
        if (timekeeper_is_synchronized()) {
            time_t now = timekeeper_now();
            struct tm local_time;
            localtime_r(&now, &local_time);

            scheduled_event_t due_events[SCHEDULER_MAX_EVENTS];
            size_t due_count = 0;
            if (xSemaphoreTake(events_lock, pdMS_TO_TICKS(100)) == pdTRUE) {
                for (size_t index = 0; index < SCHEDULER_MAX_EVENTS; index++) {
                    scheduled_event_t *scheduled = &events[index];
                    if (!scheduled->active || scheduled->hour != local_time.tm_hour || scheduled->minute != local_time.tm_min || (scheduled->fired_year == local_time.tm_year && scheduled->fired_yday == local_time.tm_yday)) {
                        continue;
                    }
                    scheduled->fired_year = local_time.tm_year;
                    scheduled->fired_yday = local_time.tm_yday;
                    due_events[due_count++] = *scheduled;
                }
                xSemaphoreGive(events_lock);
            }

            for (size_t index = 0; index < due_count; index++) {
                ESP_LOGI(TAG, "Firing daily event %lu at %02u:%02u", (unsigned long)due_events[index].id, due_events[index].hour, due_events[index].minute);
                due_events[index].event(due_events[index].context);
            }
        }
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

bool scheduler_start(void)
{
    events_lock = xSemaphoreCreateMutex();
    if (events_lock == NULL || xTaskCreate(scheduler_task, "scheduler", 4096, NULL, 4, NULL) != pdPASS) {
        ESP_LOGE(TAG, "Could not start scheduler");
        return false;
    }
    return true;
}

bool scheduler_schedule_daily(uint8_t hour, uint8_t minute, scheduler_event_fn event, void *context, scheduler_event_id_t *id)
{
    if (hour > 23 || minute > 59 || event == NULL || id == NULL || events_lock == NULL) {
        return false;
    }

    if (xSemaphoreTake(events_lock, pdMS_TO_TICKS(100)) != pdTRUE) {
        return false;
    }

    for (size_t index = 0; index < SCHEDULER_MAX_EVENTS; index++) {
        if (!events[index].active) {
            events[index] = (scheduled_event_t){
                .active = true,
                .hour = hour,
                .minute = minute,
                .event = event,
                .context = context,
                .id = next_id++,
                .fired_year = -1,
                .fired_yday = -1,
            };
            *id = events[index].id;
            xSemaphoreGive(events_lock);
            return true;
        }
    }

    xSemaphoreGive(events_lock);
    return false;
}

bool scheduler_cancel(scheduler_event_id_t id)
{
    if (id == 0 || events_lock == NULL || xSemaphoreTake(events_lock, pdMS_TO_TICKS(100)) != pdTRUE) {
        return false;
    }

    for (size_t index = 0; index < SCHEDULER_MAX_EVENTS; index++) {
        if (events[index].active && events[index].id == id) {
            events[index].active = false;
            xSemaphoreGive(events_lock);
            return true;
        }
    }

    xSemaphoreGive(events_lock);
    return false;
}
