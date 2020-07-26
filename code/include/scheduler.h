#include "timeKeeper.h"

#include <time.h>
#include <functional>

#ifndef PET_SCHEDULER
#define PET_SCHEDULER

class Scheduler {
public:
    Scheduler(TimeKeeper *timeKeeper);

    void scheduleEvent(time_t time, std::function<void()> event);
    void cancelEvent();

    void update();
private:
    TimeKeeper *timeKeeper;
    time_t nextEventTime;
    std::function<void()>nextEvent;
};

#endif
