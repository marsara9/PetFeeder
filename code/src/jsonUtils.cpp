#include "jsonUtils.h"

#include <time.h>
#include <stdio.h>

std::string feedingToJson(Feeding feeding) {

    char time_buf[21]; // YYYY-MM-DDTHH:mm:ssZ
    struct tm ts = *gmtime(&feeding.date);
    strftime(time_buf, sizeof(time_buf), "%FT%TZ", &ts);

    char cupsString2[6]; // 0.000
    snprintf(cupsString2, sizeof(cupsString2), "%f", feeding.cups);

    return "{ \"id\" : \"" + feeding.id + "\", \"cups\" : " + cupsString2 + ", \"time\" : \"" + time_buf + "\" }";
}

std::string scheduleToJson(Schedule schedule) {

}

std::string settingsToJson(Settings settings) {
    
}
