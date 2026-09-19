#ifndef PETFEEDER_WEBSERVER_H
#define PETFEEDER_WEBSERVER_H

#include <stdbool.h>
#include <stddef.h>

#include "wifi_credentials.h"
#include "schedule.h"
#include "feeding.h"
#include "datastore_config.h"

typedef bool (*webserver_save_credentials_fn)(const WifiCredentials *credentials);
typedef bool (*webserver_get_schedules_fn)(Schedule *schedules, size_t capacity, size_t *count);
typedef bool (*webserver_save_schedule_fn)(const Schedule *schedule);
typedef bool (*webserver_delete_schedule_fn)(const char *id);
typedef bool (*webserver_get_feedings_fn)(Feeding *feedings, size_t capacity, size_t *count);
typedef bool (*webserver_feed_fn)(float cups, Feeding *feeding);

bool webserver_start(
	const WifiCredentials *credentials,
	webserver_save_credentials_fn save_credentials,
	webserver_get_schedules_fn get_schedules,
	webserver_save_schedule_fn save_schedule,
	webserver_delete_schedule_fn delete_schedule,
	webserver_get_feedings_fn get_feedings,
	webserver_feed_fn feed);

#endif
