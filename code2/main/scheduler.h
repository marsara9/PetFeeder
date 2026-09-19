#ifndef PETFEEDER_SCHEDULER_H
#define PETFEEDER_SCHEDULER_H

#include <stdbool.h>
#include <stdint.h>

#define SCHEDULER_MAX_EVENTS 32

typedef uint32_t scheduler_event_id_t;
typedef void (*scheduler_event_fn)(void *context);

bool scheduler_start(void);
bool scheduler_schedule_daily(uint8_t hour, uint8_t minute, scheduler_event_fn event, void *context, scheduler_event_id_t *id);
bool scheduler_cancel(scheduler_event_id_t id);

#endif
