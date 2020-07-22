#include <string>

#ifndef PET_SCHEDULE
#define PET_SCHEDULE

struct Schedule {
    std::string id;
    const float cups;
    const int hour;
    const int minute;
};

#endif