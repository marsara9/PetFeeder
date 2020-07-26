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
    nextEventTime = 0;
    nextEvent = nullptr;
}

void Scheduler::update() {
    if(nextEvent != nullptr && timeKeeper->now() >= nextEventTime) {
        nextEvent();
        cancelEvent();
    }
}
