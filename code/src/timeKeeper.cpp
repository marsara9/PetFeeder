#include "timeKeeper.h"

#ifdef ARDUINO_ARCH_ESP32

#include <sntp.h>
#include <lwip/apps/sntp.h>
#include <tcpip_adapter.h>

#else

#include <WiFiUDP.h>
#include <NTPClient.h>

#endif

TimeKeeper::TimeKeeper() {
    
}

#ifdef ARDUINO_ARCH_ESP32

const char* ntpServer = "pool.ntp.org";

void TimeKeeper::begin() {
    tcpip_adapter_init();  // Should not hurt anything if already inited
    if(sntp_enabled()){
        sntp_stop();
    }
    sntp_setoperatingmode(0);
    sntp_setservername(0, (char*)ntpServer);
    sntp_init();
    //setTimeZone(0, 0);
}

time_t TimeKeeper::now() {
    time_t now;
    time(&now);
    return now;
}

bool TimeKeeper::update() {
    return true;
}

#else

WiFiUDP ntpUDP;
NTPClient *timeClient = new NTPClient(ntpUDP);

void TimeKeeper::begin() {
    timeClient->begin();
}

time_t TimeKeeper::now() {
    return timeClient->getEpochTime();
}

bool TimeKeeper::update() {
    return timeClient->update();
}

#endif

time_t TimeKeeper::next(int hour, int minute) {
    time_t now = this->now();
    tm t = *gmtime(&now);

    t.tm_hour = hour;
    t.tm_min = minute;
    t.tm_sec = 0;

    time_t result = mktime(&t);

    // there's a buffer of 59 seconds added.  This is to account for
    // time drifting and to make sure that we just don't repeat the
    // same event over and over again.
    if(now - result > 0) { 
        result += 86400;
    }
    
    return result;
}
