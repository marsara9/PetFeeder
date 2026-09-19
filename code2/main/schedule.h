#ifndef PETFEEDER_SCHEDULE_H
#define PETFEEDER_SCHEDULE_H

#include <stdint.h>

#define SCHEDULE_ID_MAX_LENGTH 37
#define MAX_SCHEDULES 32

typedef struct {
    char id[SCHEDULE_ID_MAX_LENGTH];
    float cups;
    uint8_t hour;
    uint8_t minute;
} Schedule;

#endif
