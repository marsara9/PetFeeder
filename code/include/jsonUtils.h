
#include "models/feeding.h"
#include "models/schedule.h"
#include "models/settings.h"

#include <string>

#ifndef PET_JSON
#define PET_JSON

std::string feedingToJson(Feeding feeding);
std::string scheduleToJson(Schedule schedule);
std::string settingsToJson(Settings settings);

#endif
