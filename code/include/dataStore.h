#include "models/feeding.h"
#include "models/schedule.h"
#include "models/settings.h"

#include <FS.h>
#include <vector>
#include <functional>

#ifndef PET_DATASTORE
#define PET_DATASTORE

class DataStore {
public:
    DataStore();
    bool begin();

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
    template<typename T> T readBytesFromFile(fs::File file);
    template<typename T> void writeBytesToFile(fs::File file, T data);
    template<typename T> std::vector<T> enumerateFiles(std::string folder, std::function<T(fs::File)> read);
    template<typename T> T read(std::string id, std::string folder, std::function<T(fs::File)> read);
    template<typename T> void save(T item, std::string id, std::string folder, std::function<void(T, fs::File)> write);

    Feeding feedingFromFile(fs::File);
    Schedule scheduleFromFile(fs::File);
    Settings settingsFromFile(fs::File);

    void feedingToFile(Feeding, fs::File);
    void scheduleToFile(Schedule, fs::File);
    void settingsToFile(Settings, fs::File);

    Settings getFactoryDefaultSettings();
};

#endif