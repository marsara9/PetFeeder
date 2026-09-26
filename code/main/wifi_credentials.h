#ifndef PETFEEDER_WIFI_CREDENTIALS_H
#define PETFEEDER_WIFI_CREDENTIALS_H

#define WIFI_CREDENTIAL_MAX_LENGTH 64

typedef struct {
    char ssid[WIFI_CREDENTIAL_MAX_LENGTH];
    char password[WIFI_CREDENTIAL_MAX_LENGTH];
    char hostname[WIFI_CREDENTIAL_MAX_LENGTH];
} WifiCredentials;

#endif
