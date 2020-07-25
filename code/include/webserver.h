#include "models/settings.h"
#include "models/feeding.h"

#include <vector>

#ifndef PET_SERVER
#define PET_SERVER

class WebServer {
    public:
        WebServer(int port);
        void startServer();
        void handleClient();

        void onGetSettings(std::function<Settings()> callback);
        void onSettingsChanged(std::function<void(Settings)> callback);

        void onGetFeedings(std::function<std::vector<Feeding>()> callback);

        void onFeed(std::function<void(Feeding)> callback);
        void isValidFeedAmount(std::function<bool(float)> callback);
    private:
        void handleNotFound();

        void handleGETSettings();
        void handlePUTSettings();

        void handleGETFeed();
        void handlePOSTFeed();
};

#endif
