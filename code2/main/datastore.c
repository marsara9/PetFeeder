#include "datastore.h"

#include <dirent.h>
#include <errno.h>
#include <stdio.h>
#include <string.h>

#include "driver/sdspi_host.h"
#include "driver/spi_common.h"
#include "esp_log.h"
#include "esp_vfs_fat.h"
#include "sdmmc_cmd.h"

#define SD_MOSI_GPIO 23
#define SD_MISO_GPIO 19
#define SD_CLK_GPIO 18
#define SD_CS_GPIO 5
#define SD_MOUNT_POINT "/sdcard"
#define WIFI_CREDENTIALS_PATH SD_MOUNT_POINT "/wifi"

static const char *TAG = "datastore";

static void trim_line_end(char *line)
{
    line[strcspn(line, "\r\n")] = '\0';
}

static bool read_key_value(char *line, const char *key, char *value, size_t value_size)
{
    size_t key_length = strlen(key);
    if (strncmp(line, key, key_length) != 0 || line[key_length] != '=') {
        return false;
    }

    strncpy(value, line + key_length + 1, value_size - 1);
    value[value_size - 1] = '\0';
    return true;
}

bool datastore_init(void)
{
    spi_bus_config_t bus_config = {
        .mosi_io_num = SD_MOSI_GPIO,
        .miso_io_num = SD_MISO_GPIO,
        .sclk_io_num = SD_CLK_GPIO,
        .quadwp_io_num = -1,
        .quadhd_io_num = -1,
        .max_transfer_sz = 4000,
    };

    esp_err_t result = spi_bus_initialize(SPI2_HOST, &bus_config, SDSPI_DEFAULT_DMA);
    if (result != ESP_OK && result != ESP_ERR_INVALID_STATE) {
        ESP_LOGE(TAG, "Could not initialize SD SPI bus: %s", esp_err_to_name(result));
        return false;
    }

    sdmmc_host_t host = SDSPI_HOST_DEFAULT();
    host.slot = SPI2_HOST;
    host.max_freq_khz = 4000;

    sdspi_device_config_t slot_config = SDSPI_DEVICE_CONFIG_DEFAULT();
    slot_config.gpio_cs = SD_CS_GPIO;
    slot_config.host_id = SPI2_HOST;

    esp_vfs_fat_mount_config_t mount_config = {
        .format_if_mount_failed = false,
        .max_files = 5,
        .allocation_unit_size = 16 * 1024,
    };
    sdmmc_card_t *card;
    result = esp_vfs_fat_sdspi_mount(SD_MOUNT_POINT, &host, &slot_config, &mount_config, &card);
    if (result != ESP_OK) {
        ESP_LOGE(TAG, "Could not mount SD card: %s", esp_err_to_name(result));
        return false;
    }

    ESP_LOGI(TAG, "SD card mounted at %s", SD_MOUNT_POINT);
    sdmmc_card_print_info(stdout, card);
    return true;
}

bool datastore_read_wifi_credentials(WifiCredentials *credentials)
{
    if (credentials == NULL) {
        return false;
    }

    FILE *file = fopen(WIFI_CREDENTIALS_PATH, "r");
    if (file == NULL) {
        ESP_LOGW(TAG, "Could not open %s: errno=%d (%s)", WIFI_CREDENTIALS_PATH, errno, strerror(errno));
        DIR *root = opendir(SD_MOUNT_POINT);
        if (root != NULL) {
            struct dirent *entry;
            while ((entry = readdir(root)) != NULL) {
                ESP_LOGI(TAG, "SD root entry: %s", entry->d_name);
            }
            closedir(root);
        }
        return false;
    }

    char line[2 * WIFI_CREDENTIAL_MAX_LENGTH];
    while (fgets(line, sizeof(line), file) != NULL) {
        trim_line_end(line);
        read_key_value(line, "ssid", credentials->ssid, sizeof(credentials->ssid));
        read_key_value(line, "password", credentials->password, sizeof(credentials->password));
    }
    fclose(file);

    ESP_LOGI(TAG, "Loaded Wi-Fi credentials for SSID '%s'", credentials->ssid);
    return credentials->ssid[0] != '\0';
}