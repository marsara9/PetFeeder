#ifndef PETFEEDER_DATASTORE_H
#define PETFEEDER_DATASTORE_H

#include <stdbool.h>

#include "wifi_credentials.h"

bool datastore_init(void);
bool datastore_read_wifi_credentials(WifiCredentials *credentials);
bool datastore_write_wifi_credentials(const WifiCredentials *credentials);

#endif