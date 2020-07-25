#include "models/settings.h"
#include "models/feeding.h"

#ifndef PET_WEBSERVER
#define PET_WEBSERVER

class WebServer {
    public:
        WebServer(int port);
        void startServer();
        void handleClient();

        void onGetSettings(Settings callback());
        void onSettingsChanged(void callback(Settings settings));

        void onFeed(void callback(Feeding));
        void isValidFeedAmount(bool callback(float));
    private:
        void handleNotFound();

        void handleGETSettings();
        void handlePUTSettings();

        void handlePOSTFeed();
};

#endif
