#include "jsonUtils.h"

#include <time.h>
#include <stdio.h>
#include <sstream>

std::string feedingToJson(Feeding feeding) {

    char time_buf[21]; // YYYY-MM-DDTHH:mm:ssZ
    struct tm ts = *gmtime(&feeding.date);
    strftime(time_buf, sizeof(time_buf), "%FT%TZ", &ts);

    char cupsString[6]; // 0.000
    snprintf(cupsString, sizeof(cupsString), "%f", feeding.cups);

    return "{ \"id\" : \"" + feeding.id + "\", \"cups\" : " + cupsString + ", \"time\" : \"" + time_buf + "\" }";
}

std::string scheduleToJson(Schedule schedule) {

    char cupsString[6]; // 0.000
    snprintf(cupsString, sizeof(cupsString), "%f", schedule.cups);

    std::stringstream ss;
    ss << schedule.hour << ":" << schedule.minute;

    return "{ \"id\" : \"" + schedule.id + "\", \"cups\" : " + cupsString + ", \"time\" : \"" + ss.str() + "\" }";
}

std::string settingsToJson(Settings settings) {
    return "{ \"ssid\" : \"" + settings.ssid + "\", \"name\" : \"" + settings.name + "\" }";
}
