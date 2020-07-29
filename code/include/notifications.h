
#include "models./feeding.h"
#include "models/settings.h"
#include "models/registration.h"

#include <string>
#include <functional>
#include <vector>

#ifndef PET_NOTIFICATIONS
#define PET_NOTIFICATIONS

class Notifications {
public:
    Notifications();

    void begin(std::string authorizationKey);

    void send(Settings settings, Feeding feeding);

    void onGetAllRegisteredDevices(std::function<std::vector<Registration>()>);
private:
    std::string authorizationKey;

    std::string createNotification(Settings settings, Feeding feeding);

    void sendFCMNotification(std::string token, std::string message);
};

#endif
