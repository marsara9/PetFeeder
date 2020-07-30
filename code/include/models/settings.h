#include <string>

#ifndef PET_SETTINGS
#define PET_SETTINGS

struct Settings {
    std::string ssid;
    std::string password;
    std::string name;
    uint8_t fcm_fingerprint[20];
};

#endif
