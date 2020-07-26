#include "models/settings.h"
#include "models/feeding.h"
#include "models/schedule.h"
#include "timeKeeper.h"

#include <functional>
#include <vector>

#ifndef PET_WEBSERVER
#define PET_WEBSERVER

class WebServer {
    public:
        WebServer(int port, TimeKeeper* timeKeeper);
        
        void startServer();
        void handleClient();

        void onGetSettings(Settings callback());
        void onSettingsChanged(void callback(Settings settings));

        void onFeed(void callback(Feeding));
        void isValidFeedAmount(bool callback(float));

        void onGetAllScheduledFeedings(std::function<std::vector<Schedule>()>);
        void onAddScheduledFeeding(std::function<void(Schedule)>);
    private:
        TimeKeeper* timeKeeper;

        void handleNotFound();

        void handleGETSettings();
        void handlePUTSettings();

        void handlePOSTFeed();

        void handleGETSchedules();
        void handlePOSTSchedule();
};

#endif
