#ifndef PETFEEDER_FEEDING_H
#define PETFEEDER_FEEDING_H

#include <stdint.h>
#include <time.h>

#define FEEDING_ID_MAX_LENGTH 37

typedef struct {
    char id[FEEDING_ID_MAX_LENGTH];
    float cups;
    time_t date;
} Feeding;

#endif
