#include "models/settings.h"

#include <string>
#include <IPAddress.h>

#ifndef PET_WIFI
#define PET_WIFI

class WiFiConnection {
public:
    WiFiConnection();
    void begin(Settings settings);
    
    void checkStatus();
private:
    std::string defaultName;

    Settings settings;
    bool createAccessPoint();
};

#endif
