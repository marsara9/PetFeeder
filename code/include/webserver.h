#include "models/settings.h"
#include "models/feeding.h"
#include "models/schedule.h"
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

        void onGetSettings(std::function<Settings()>);
        void onSettingsChanged(std::function<void(Settings)>);
        void onDeleteSettings(std::function<void()>);

        void onGetFeedings(std::function<std::vector<Feeding>()>);

        void onFeed(std::function<void(Feeding)>);
        void isValidFeedAmount(std::function<bool(float)>);

        void onGetAllScheduledFeedings(std::function<std::vector<Schedule>()>);
        void onAddScheduledFeeding(std::function<void(Schedule)>);

    private:
        TimeKeeper* timeKeeper;

        void printRequest();
        void sendResponse(int code, const char* contentType, std::string response);

        void handleNotFound();

        void handleGETSettings();
        void handlePUTSettings();
        void handleDELETESettings();

        void handleGETFeed();
        void handlePOSTFeed();

        void handleGETSchedules();
        void handlePOSTSchedule();
};

#endif
