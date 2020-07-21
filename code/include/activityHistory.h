#include "models/feeding.h"
#include "models/schedule.h"
#include "models/settings.h"

#ifndef PET_LOGGING
#define PET_LOGGING

class ActivityHistory {
public:
    ActivityHistory();

    void put(Feeding);
    void put(Schedule);
    void put(Settings);

    void getAll(Feeding*, int size);
    void getAll(Schedule*, int size);

    Feeding getFeeding(const char* id);
    Schedule getSchedule(const char* id);
    Settings getSettings();

    void deleteAllFeedings();
    void deleteAllSchedules();
    void deleteSettings();
    
    void restoreToFactoryDefaults();
private:
    bool hasSDCard;
};

#endif