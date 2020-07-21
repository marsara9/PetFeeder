#include "models/settings.h"

#include <string>
#include <IPAddress.h>

#ifndef PET_WIFI
#define PET_WIFI

class WiFiConnection {
public:
    WiFiConnection();
    void checkStatus();
    void setSettings(Settings settings);
private:
    Settings settings;
    bool createAccessPoint();
};

#endif
