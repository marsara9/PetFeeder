#ifndef PETFEEDER_TIMEKEEPER_H
#define PETFEEDER_TIMEKEEPER_H

#include <stdbool.h>
#include <time.h>

bool timekeeper_start(void);
bool timekeeper_is_synchronized(void);
time_t timekeeper_now(void);
bool timekeeper_next(int hour, int minute, time_t *result);

#endif
