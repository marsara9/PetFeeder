#include "datastore.h"

#include <dirent.h>
#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

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
#define WIFI_CREDENTIALS_TEMP_PATH SD_MOUNT_POINT "/wifi.tmp"
#define SCHEDULES_PATH SD_MOUNT_POINT "/schedules"
#define SCHEDULES_TEMP_SUFFIX ".tmp"
#define FEEDINGS_PATH SD_MOUNT_POINT "/feedings"
#define FEEDINGS_TEMP_PATH SD_MOUNT_POINT "/feedings.tmp"

static const char *TAG = "datastore";
static bool datastore_mounted;

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
    if (mkdir(SCHEDULES_PATH, 0777) != 0 && errno != EEXIST) {
        ESP_LOGW(TAG, "Schedules directory will be created on first write: errno=%d (%s)", errno, strerror(errno));
    }
    datastore_mounted = true;
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

bool datastore_write_wifi_credentials(const WifiCredentials *credentials)
{
    if (!datastore_mounted || credentials == NULL || credentials->ssid[0] == '\0') {
        return false;
    }

    FILE *file = fopen(WIFI_CREDENTIALS_TEMP_PATH, "w");
    if (file == NULL) {
        ESP_LOGE(TAG, "Could not open temporary credentials file: errno=%d (%s)", errno, strerror(errno));
        return false;
    }

    int result = fprintf(file, "ssid=%s\npassword=%s\n", credentials->ssid, credentials->password);
    bool write_succeeded = result >= 0 && fclose(file) == 0;
    if (!write_succeeded) {
        fclose(file);
        remove(WIFI_CREDENTIALS_TEMP_PATH);
        return false;
    }

    if (remove(WIFI_CREDENTIALS_PATH) != 0 && errno != ENOENT) {
        ESP_LOGE(TAG, "Could not remove existing credentials file: errno=%d (%s)", errno, strerror(errno));
        remove(WIFI_CREDENTIALS_TEMP_PATH);
        return false;
    }

    if (rename(WIFI_CREDENTIALS_TEMP_PATH, WIFI_CREDENTIALS_PATH) != 0) {
        ESP_LOGE(TAG, "Could not replace credentials file: errno=%d (%s)", errno, strerror(errno));
        remove(WIFI_CREDENTIALS_TEMP_PATH);
        return false;
    }

    ESP_LOGI(TAG, "Saved Wi-Fi credentials for SSID '%s'", credentials->ssid);
    return true;
}

static bool read_schedule_file(const char *path, Schedule *schedule)
{
    FILE *file = fopen(path, "r");
    if (file == NULL) {
        return false;
    }

    char line[64];
    bool has_cups = false;
    bool has_hour = false;
    bool has_minute = false;
    char value[64];
    while (fgets(line, sizeof(line), file) != NULL) {
        trim_line_end(line);
        if (read_key_value(line, "cups", value, sizeof(value))) {
            schedule->cups = strtof(value, NULL);
            has_cups = true;
        } else if (read_key_value(line, "hour", value, sizeof(value))) {
            schedule->hour = (uint8_t)strtoul(value, NULL, 10);
            has_hour = true;
        } else if (read_key_value(line, "minute", value, sizeof(value))) {
            schedule->minute = (uint8_t)strtoul(value, NULL, 10);
            has_minute = true;
        }
    }
    fclose(file);
    return has_cups && has_hour && has_minute;
}

bool datastore_get_schedules(Schedule *schedules, size_t capacity, size_t *count)
{
    if (!datastore_mounted || schedules == NULL || count == NULL) {
        return false;
    }

    *count = 0;
    DIR *directory = opendir(SCHEDULES_PATH);
    if (directory == NULL) {
        ESP_LOGI(TAG, "Schedules directory not found; returning an empty schedule list");
        return true;
    }

    struct dirent *entry;
    while ((entry = readdir(directory)) != NULL && *count < capacity) {
        if (entry->d_name[0] == '.') {
            continue;
        }

        Schedule schedule = {0};
        strncpy(schedule.id, entry->d_name, sizeof(schedule.id) - 1);
        char path[320];
        snprintf(path, sizeof(path), "%s/%s", SCHEDULES_PATH, entry->d_name);
        if (read_schedule_file(path, &schedule)) {
            schedules[*count] = schedule;
            (*count)++;
        }
    }
    closedir(directory);
    return true;
}

bool datastore_write_schedule(const Schedule *schedule)
{
    if (!datastore_mounted || schedule == NULL || schedule->id[0] == '\0') {
        return false;
    }

    if (mkdir(SCHEDULES_PATH, 0777) != 0 && errno != EEXIST) {
        ESP_LOGE(TAG, "Could not create schedules directory: errno=%d (%s)", errno, strerror(errno));
        return false;
    }

    char path[128];
    char temporary_path[128];
    snprintf(path, sizeof(path), "%s/%s", SCHEDULES_PATH, schedule->id);
    snprintf(temporary_path, sizeof(temporary_path), "%s/%s%s", SCHEDULES_PATH, schedule->id, SCHEDULES_TEMP_SUFFIX);
    FILE *file = fopen(temporary_path, "w");
    if (file == NULL) {
        return false;
    }

    int result = fprintf(file, "cups=%.3f\nhour=%u\nminute=%u\n", schedule->cups, schedule->hour, schedule->minute);
    if (result < 0 || fclose(file) != 0) {
        remove(temporary_path);
        return false;
    }

    if (remove(path) != 0 && errno != ENOENT) {
        ESP_LOGE(TAG, "Could not remove existing schedule: errno=%d (%s)", errno, strerror(errno));
        remove(temporary_path);
        return false;
    }

    if (rename(temporary_path, path) != 0) {
        ESP_LOGE(TAG, "Could not replace schedule: errno=%d (%s)", errno, strerror(errno));
        remove(temporary_path);
        return false;
    }
    return true;
}

bool datastore_delete_schedule(const char *id)
{
    if (!datastore_mounted || id == NULL || id[0] == '\0') {
        return false;
    }

    char path[128];
    snprintf(path, sizeof(path), "%s/%s", SCHEDULES_PATH, id);
    return remove(path) == 0 || errno == ENOENT;
}

static bool read_feedings_file(Feeding *feedings, size_t capacity, size_t *count)
{
    FILE *file = fopen(FEEDINGS_PATH, "r");
    if (file == NULL) {
        *count = 0;
        return errno == ENOENT;
    }

    *count = 0;
    char line[128];
    while (fgets(line, sizeof(line), file) != NULL) {
        if (*count >= capacity) {
            break;
        }

        Feeding feeding = {0};
        long timestamp = 0;
        if (sscanf(line, "%36[^,],%f,%ld", feeding.id, &feeding.cups, &timestamp) == 3) {
            feeding.date = (time_t)timestamp;
            feedings[*count] = feeding;
            (*count)++;
        }
    }
    fclose(file);
    return true;
}

static bool write_feedings_file(const Feeding *feedings, size_t count)
{
    FILE *file = fopen(FEEDINGS_TEMP_PATH, "w");
    if (file == NULL) {
        ESP_LOGE(TAG, "Could not open temporary feeding history: errno=%d (%s)", errno, strerror(errno));
        return false;
    }

    for (size_t index = 0; index < count; index++) {
        if (fprintf(file, "%s,%.3f,%ld\n", feedings[index].id, feedings[index].cups, (long)feedings[index].date) < 0) {
            fclose(file);
            remove(FEEDINGS_TEMP_PATH);
            return false;
        }
    }

    if (fclose(file) != 0 || (remove(FEEDINGS_PATH) != 0 && errno != ENOENT) || rename(FEEDINGS_TEMP_PATH, FEEDINGS_PATH) != 0) {
        ESP_LOGE(TAG, "Could not replace feeding history: errno=%d (%s)", errno, strerror(errno));
        remove(FEEDINGS_TEMP_PATH);
        return false;
    }
    return true;
}

bool datastore_get_feedings(Feeding *feedings, size_t capacity, size_t *count)
{
    if (!datastore_mounted || feedings == NULL || count == NULL) {
        return false;
    }
    return read_feedings_file(feedings, capacity, count);
}

bool datastore_record_feeding(const Feeding *feeding)
{
    static Feeding history[DATASTORE_MAX_FEEDINGS + 1];
    size_t count = 0;
    if (!datastore_mounted || feeding == NULL || feeding->id[0] == '\0') {
        return false;
    }
    if (!read_feedings_file(history, DATASTORE_MAX_FEEDINGS, &count)) {
        return false;
    }

    if (count == DATASTORE_MAX_FEEDINGS) {
        memmove(&history[0], &history[1], (count - 1) * sizeof(history[0]));
        count--;
    }
    history[count++] = *feeding;

    time_t now;
    time(&now);
    if (now > 1600000000) {
        time_t cutoff = now - (time_t)DATASTORE_FEEDING_RETENTION_DAYS * 86400;
        size_t first_retained = 0;
        while (first_retained < count && history[first_retained].date < cutoff) {
            first_retained++;
        }
        if (first_retained > 0) {
            memmove(history, &history[first_retained], (count - first_retained) * sizeof(history[0]));
            count -= first_retained;
        }
    }

    return write_feedings_file(history, count);
}
