#ifndef PETFEEDER_WEBSERVER_H
#define PETFEEDER_WEBSERVER_H

#include <stdbool.h>

#include "wifi_credentials.h"

typedef bool (*webserver_save_credentials_fn)(const WifiCredentials *credentials);

bool webserver_start(const WifiCredentials *credentials, webserver_save_credentials_fn save_credentials);

#endif
