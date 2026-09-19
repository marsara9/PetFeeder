#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#include "driver/uart.h"
#include "esp_err.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

#include "datastore.h"
#include "webserver.h"
#include "wifi.h"

#define UART_PORT UART_NUM_0
#define UART_BAUD_RATE 115200
#define UART_BUFFER_SIZE 256

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
    webserver_start(
        &credentials,
        datastore_write_wifi_credentials,
        datastore_get_schedules,
        datastore_write_schedule,
        datastore_delete_schedule);

    uint8_t buffer[UART_BUFFER_SIZE];
    while (true) {
        int length = uart_read_bytes(UART_PORT, buffer, sizeof(buffer), pdMS_TO_TICKS(100));
        if (length > 0) {
            uart_write_bytes(UART_PORT, (const char *)buffer, length);
        }
    }
}
