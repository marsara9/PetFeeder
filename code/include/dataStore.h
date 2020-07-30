#include "models/feeding.h"
#include "models/schedule.h"
#include "models/settings.h"
#include "models/registration.h"

#include <FS.h>
#include <vector>
#include <functional>
#include <string>

#ifndef PET_DATASTORE
#define PET_DATASTORE

class DataStore {
public:
    DataStore();
    bool begin();

    void put(Feeding);
    void put(Schedule);
    void put(Settings);
    void putRegistration(Registration);

    std::vector<Feeding> getAllFeedings();
    std::vector<Schedule> getAllSchedules();
    std::vector<Registration> getAllRegisteredDevices();

    Settings getSettings();

    void deleteRegistration(std::string id);

    void deleteAllFeedings();
    void deleteAllSchedules();
    void deleteSettings();
    void deleteAllRegisteredDevices();
    
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
    Registration registrationFromFile(fs::File);

    void feedingToFile(Feeding, fs::File);
    void scheduleToFile(Schedule, fs::File);
    void settingsToFile(Settings, fs::File);
    void registrationToFile(Registration, fs::File);

    Settings getFactoryDefaultSettings();
};

#endif
