#ifndef PETFEEDER_WEBSERVER_H
#define PETFEEDER_WEBSERVER_H

#include <stdbool.h>
#include <stddef.h>

#include "wifi_credentials.h"
#include "schedule.h"

typedef bool (*webserver_save_credentials_fn)(const WifiCredentials *credentials);
typedef bool (*webserver_get_schedules_fn)(Schedule *schedules, size_t capacity, size_t *count);
typedef bool (*webserver_save_schedule_fn)(const Schedule *schedule);
typedef bool (*webserver_delete_schedule_fn)(const char *id);

bool webserver_start(
	const WifiCredentials *credentials,
	webserver_save_credentials_fn save_credentials,
	webserver_get_schedules_fn get_schedules,
	webserver_save_schedule_fn save_schedule,
	webserver_delete_schedule_fn delete_schedule);

#endif
