
#include "models/feeding.h"
#include "models/schedule.h"
#include "models/settings.h"
#include "models/registration.h"

#include <string>
#include <vector>
#include <functional>
#include <sstream>

#ifndef PET_JSON
#define PET_JSON

template<typename T> std::string toJsonArray(std::vector<T> items, std::function<std::string(T)> toJson) {
    std::ostringstream stream;
    stream << "[";
    for (const auto& item : items) {
        if (&item != &items[0]) {
            stream << ",";
        }
        stream << toJson(item);
    }
    stream << "]";

    return stream.str();
}

std::string feedingToJson(Feeding feeding);
std::string scheduleToJson(Schedule schedule);
std::string registrationToJson(Registration registration);
std::string settingsToJson(Settings settings);

Registration registrationFromJson(std::string json);

std::string createUUID();

#endif
