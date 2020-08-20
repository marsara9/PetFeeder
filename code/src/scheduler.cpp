#include "scheduler.h"

#include <vector>
#include <algorithm>

Scheduler::Scheduler(TimeKeeper* timeKeeper) {
    this->timeKeeper = timeKeeper;
}

void Scheduler::scheduleEvent(time_t time, std::function<void()> event) {
    nextEventTime = time;
    nextEvent = event;
}

void Scheduler::cancelEvent() {
    nextEventTime = __LONG_MAX__;
    nextEvent = nullptr;
}

void Scheduler::update() {
    if(nextEvent != nullptr && timeKeeper->now() >= nextEventTime) {
        std::function<void()> currentEvent = nextEvent;
        cancelEvent();
        currentEvent();
    }
}
