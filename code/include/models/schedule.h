#include <string>

#ifndef PET_SCHEDULE
#define PET_SCHEDULE

struct Schedule {
    std::string id;
    const float cups;
    const uint8_t hour;
    const uint8_t minute;
};

#endif