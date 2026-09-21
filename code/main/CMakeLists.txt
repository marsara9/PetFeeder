idf_component_register(
    SRCS "main.c" "wifi.c" "datastore.c" "webserver.c" "timekeeper.c" "scheduler.c" "motorcontrol.c"
    INCLUDE_DIRS "."
    REQUIRES driver esp_event esp_http_server json esp_netif esp_wifi nvs_flash fatfs sdmmc
)
