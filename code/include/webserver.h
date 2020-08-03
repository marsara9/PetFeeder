#include "models/settings.h"
#include "models/feeding.h"
#include "models/schedule.h"
#include "models/registration.h"
#include "timeKeeper.h"

#include <functional>
#include <vector>

#include <vector>
#include <string>
#include <functional>

#ifndef PET_WEBSERVER
#define PET_WEBSERVER

class WebServer {
    public:
        WebServer(int port, TimeKeeper* timeKeeper);
        
        void startServer();
        void handleClient();

        void onGetSettings(std::function<Settings()> callback);
        void onSettingsChanged(std::function<void(Settings)> callback);

        void onGetFeedings(std::function<std::vector<Feeding>()> callback);

        void onFeed(std::function<void(Feeding)> callback);
        void isValidFeedAmount(std::function<bool(float)> callback);

        void onGetAllScheduledFeedings(std::function<std::vector<Schedule>()>);
        void onAddScheduledFeeding(std::function<void(Schedule)>);
        void onDeleteScheduledFeeding(std::function<void(std::string)>);

        void onRegisterDevice(std::function<void(Registration)>);
        void onDeleteRegistration(std::function<void(std::string)>);

    private:
        TimeKeeper* timeKeeper;

        void printRequest();
        void sendResponse(int code, const char* contentType, std::string response);

        void handleNotFound();

        void handleGETSettings();
        void handlePUTSettings();

        void handleGETFeed();
        void handlePOSTFeed();

        void handleGETSchedules();
        void handlePOSTSchedule();
        void handleDELETESchedule();

        void handlePOSTRegister();
        void handleDELETERegister();
};

#endif
