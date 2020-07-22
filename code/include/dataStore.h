#include "models/feeding.h"
#include "models/schedule.h"
#include "models/settings.h"

#include <FS.h>

#ifndef PET_LOGGING
#define PET_LOGGING

class DataStore {
public:
    DataStore();

    void put(Feeding);
    void put(Schedule);
    void put(Settings);

    std::vector<Feeding> getAllFeedings();
    std::vector<Schedule> getAllSchedules();

    Feeding getFeeding(std::string id);
    Schedule getSchedule(std::string id);
    Settings getSettings();

    void deleteAllFeedings();
    void deleteAllSchedules();
    void deleteSettings();
    
    void restoreToFactoryDefaults();
private:
    template<typename T> T readBytesFromFile(File file);
    template<typename T> void writeBytesToFile(File file, T data);
    template<typename T> std::vector<T> enumerateFiles(std::string folder, std::function<T(File)> read);
    template<typename T> T read(std::string id, std::string folder, std::function<T(File)> read);
    template<typename T> void save(T item, std::string id, std::string folder, std::function<void(T, File)> write);

    Feeding feedingFromFile(File);
    Schedule scheduleFromFile(File);
    Settings settingsFromFile(File);

    void feedingToFile(Feeding, File);
    void scheduleToFile(Schedule, File);
    void settingsToFile(Settings, File);
};

#endif