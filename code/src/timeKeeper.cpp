#include "timeKeeper.h"

#include <WiFiUDP.h>
#include <NTPClient.h>

WiFiUDP ntpUDP;
NTPClient *timeClient = new NTPClient(ntpUDP);

TimeKeeper::TimeKeeper() {
    
}

void TimeKeeper::begin() {
    timeClient->begin();
}

time_t TimeKeeper::now() {
    return timeClient->getEpochTime();
}

time_t TimeKeeper::next(int hour, int minute) {
    time_t now = timeClient->getEpochTime();
    tm t = *gmtime(&now);

    t.tm_hour = hour;
    t.tm_min = minute;

    if(mktime(&t) < now) {
        t.tm_yday += 1;
    }
    
    return mktime(&t);
}

void TimeKeeper::update() {
    timeClient->update();
}
