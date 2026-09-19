#ifndef PETFEEDER_DATASTORE_H
#define PETFEEDER_DATASTORE_H

#include <stdbool.h>
#include <stddef.h>

#include "datastore_config.h"
#include "feeding.h"
#include "wifi_credentials.h"
#include "schedule.h"

bool datastore_init(void);
bool datastore_read_wifi_credentials(WifiCredentials *credentials);
bool datastore_write_wifi_credentials(const WifiCredentials *credentials);
bool datastore_get_schedules(Schedule *schedules, size_t capacity, size_t *count);
bool datastore_write_schedule(const Schedule *schedule);
bool datastore_delete_schedule(const char *id);
bool datastore_get_feedings(Feeding *feedings, size_t capacity, size_t *count);
bool datastore_record_feeding(const Feeding *feeding);

#endif
