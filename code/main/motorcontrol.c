#include "motorcontrol.h"

#include <math.h>
#include <stdlib.h>

#include "driver/gpio.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

#include "board_pins.h"
#include "feeding.h"

#define MOTOR_RPM 10U
#define MOTOR_STEPS_PER_REVOLUTION 200U
#define MOTOR_CONTAINERS_PER_ROTATION 2U

static const char *TAG = "motor";
static bool initialized;
static volatile bool motor_busy;

static const gpio_num_t motor_output_pins[] = {
    MOTOR_AIN1_GPIO,
    MOTOR_AIN2_GPIO,
    MOTOR_BIN1_GPIO,
    MOTOR_BIN2_GPIO,
    MOTOR_STBY_GPIO,
    MOTOR_PWMA_GPIO,
    MOTOR_PWMB_GPIO,
};

static const uint8_t full_step_sequence[4][4] = {
    {1, 0, 1, 0},
    {0, 1, 1, 0},
    {0, 1, 0, 1},
    {1, 0, 0, 1},
};

static void set_motor_outputs(const uint8_t step[4])
{
    gpio_set_level(MOTOR_AIN1_GPIO, step[0]);
    gpio_set_level(MOTOR_AIN2_GPIO, step[1]);
    gpio_set_level(MOTOR_BIN1_GPIO, step[2]);
    gpio_set_level(MOTOR_BIN2_GPIO, step[3]);
}

bool motorcontrol_init(void)
{
    for (size_t index = 0; index < sizeof(motor_output_pins) / sizeof(motor_output_pins[0]); index++) {
        if (gpio_reset_pin(motor_output_pins[index]) != ESP_OK || gpio_set_direction(motor_output_pins[index], GPIO_MODE_OUTPUT) != ESP_OK) {
            ESP_LOGE(TAG, "Could not configure motor GPIO %d", motor_output_pins[index]);
            return false;
        }
    }

    gpio_set_level(MOTOR_STBY_GPIO, 0);
    gpio_set_level(MOTOR_PWMA_GPIO, 0);
    gpio_set_level(MOTOR_PWMB_GPIO, 0);
    set_motor_outputs(full_step_sequence[0]);
    initialized = true;
    ESP_LOGI(TAG, "TB6612 stepper driver initialized");
    return true;
}

static bool motorcontrol_feed(float cups)
{
    if (!initialized || !isfinite(cups) || cups < FEEDING_MINIMUM_CUPS) {
        return false;
    }

    float steps_per_minimum_feed = (float)MOTOR_STEPS_PER_REVOLUTION / MOTOR_CONTAINERS_PER_ROTATION;
    float steps_float = (cups / FEEDING_MINIMUM_CUPS) * steps_per_minimum_feed;
    float rounded_steps = roundf(steps_float);
    if (fabsf(steps_float - rounded_steps) > 0.001f) {
        return false;
    }

    uint32_t total_steps = (uint32_t)rounded_steps;
    uint32_t step_delay_ms = 60000U / (MOTOR_RPM * MOTOR_STEPS_PER_REVOLUTION);
    gpio_set_level(MOTOR_STBY_GPIO, 1);
    gpio_set_level(MOTOR_PWMA_GPIO, 1);
    gpio_set_level(MOTOR_PWMB_GPIO, 1);

    for (uint32_t step = 0; step < total_steps; step++) {
        set_motor_outputs(full_step_sequence[step % 4]);
        vTaskDelay(pdMS_TO_TICKS(step_delay_ms));
    }

    set_motor_outputs(full_step_sequence[0]);
    gpio_set_level(MOTOR_PWMA_GPIO, 0);
    gpio_set_level(MOTOR_PWMB_GPIO, 0);
    gpio_set_level(MOTOR_STBY_GPIO, 0);
    return true;
}

static void motor_feed_task(void *context)
{
    float cups = *(float *)context;
    free(context);
    if (!motorcontrol_feed(cups)) {
        ESP_LOGE(TAG, "Motor feed failed after acceptance");
    }
    motor_busy = false;
    vTaskDelete(NULL);
}

bool motorcontrol_start_feed(float cups)
{
    if (!initialized || motor_busy || !isfinite(cups) || cups < FEEDING_MINIMUM_CUPS) {
        return false;
    }

    float *queued_cups = malloc(sizeof(*queued_cups));
    if (queued_cups == NULL) {
        return false;
    }
    *queued_cups = cups;
    motor_busy = true;

    if (xTaskCreate(motor_feed_task, "motor_feed", 3072, queued_cups, 5, NULL) != pdPASS) {
        motor_busy = false;
        free(queued_cups);
        return false;
    }
    ESP_LOGI(TAG, "Motor feed accepted for %.3f cups", cups);
    return true;
}
