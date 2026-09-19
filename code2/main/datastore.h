#ifndef PETFEEDER_DATASTORE_H
#define PETFEEDER_DATASTORE_H

#include <stdbool.h>

#define WIFI_CREDENTIAL_MAX_LENGTH 64

typedef struct {
    char ssid[WIFI_CREDENTIAL_MAX_LENGTH];
    char password[WIFI_CREDENTIAL_MAX_LENGTH];
} WifiCredentials;

bool datastore_init(void);
bool datastore_read_wifi_credentials(WifiCredentials *credentials);

#endif