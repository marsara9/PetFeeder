#ifndef PETFEEDER_MOTORCONTROL_H
#define PETFEEDER_MOTORCONTROL_H

#include <stdbool.h>

bool motorcontrol_init(void);
bool motorcontrol_start_feed(float cups);

#endif
