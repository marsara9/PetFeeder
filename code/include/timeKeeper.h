
#include <time.h>

#ifndef PET_TIMEKEEPER
#define PET_TIMEKEEPER

class TimeKeeper {
public:
    TimeKeeper();

    void begin();

    time_t now();
    time_t next(int hour, int minute);
    bool update();
};

#endif
