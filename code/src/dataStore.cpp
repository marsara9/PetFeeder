#include "dataStore.h"

#include <SPI.h>
#include <SD.h>

DataStore::DataStore() {

}

bool DataStore::begin() {
    return SD.begin(16);
}

template<typename T> T DataStore::readBytesFromFile(fs::File file) {
    union {
        T data;
        char bytes[sizeof(T)];
    } converter;

    file.readBytes(converter.bytes, sizeof(T));

    return converter.data;
}

template<typename T> void DataStore::writeBytesToFile(fs::File file, T data) {
    union {
        T data;
        char bytes[sizeof(T)];
    } converter;

    converter.data = data;

    file.write(converter.bytes, sizeof(T));
}

template<typename T> std::vector<T> DataStore::enumerateFiles(std::string folder, std::function<T(fs::File)> read) {
    std::vector<T> vector;

    if(SD.exists(folder.c_str())) {
        fs::File root = SD.open(folder.c_str());
        fs::File file = root.openNextFile();
        while(file) {
            vector.push_back(read(file));
            
            file.close();
            file = root.openNextFile();
        }

        root.close();
    }

    return vector;
}

template<typename T> T DataStore::read(std::string id, std::string folder, std::function<T(fs::File)> read) {
    std::string filename = folder + "/" + id;
    fs::File file = SD.open(filename.c_str(), FILE_READ);
    T result = read(file);
    file.close();
    return result;
}

template<typename T> void DataStore::save(T item, std::string id, std::string folder, std::function<void(T, fs::File)> write) {
    std::string filename = folder + "/" + id;
    SD.remove(filename.c_str());
    fs::File file = SD.open(filename.c_str(), FILE_WRITE);
    write(item, file);
    file.close();
}

void DataStore::put(Feeding feeding) {
    std::function<void(Feeding, fs::File)> func = std::bind(&DataStore::feedingToFile, this, std::placeholders::_1, std::placeholders::_2);
    save(feeding, feeding.id, "feedings", func);
}

void DataStore::put(Schedule schedule) {
    std::function<void(Schedule, fs::File)> func = std::bind(&DataStore::scheduleToFile, this, std::placeholders::_1, std::placeholders::_2);
    save(schedule, schedule.id, "schedules", func);
}

void DataStore::put(Settings settings) {
    std::function<void(Settings, fs::File)> func = std::bind(&DataStore::settingsToFile, this, std::placeholders::_1, std::placeholders::_2);
    save(settings, "0", "", func);
}

void DataStore::putRegistration(Registration registration) {
    std::function<void(Registration, fs::File)> func = std::bind(&DataStore::registrationToFile, this, std::placeholders::_1, std::placeholders::_2);
    save(registration, registration.id, "registrations", func);
}

std::vector<Feeding> DataStore::getAllFeedings() {
    std::function<Feeding(fs::File)> func = std::bind(&DataStore::feedingFromFile, this, std::placeholders::_1);
    return enumerateFiles("feedings", func);
}

std::vector<Schedule> DataStore::getAllSchedules() {
    std::function<Schedule(fs::File)> func = std::bind(&DataStore::scheduleFromFile, this, std::placeholders::_1);
    return enumerateFiles("schedules", func);
}

std::vector<Registration> DataStore::getAllRegisteredDevices() {
    std::function<Registration(fs::File)> func = std::bind(&DataStore::registrationFromFile, this, std::placeholders::_1);
    return enumerateFiles("registrations", func);
}

Settings DataStore::getSettings() {
    if(SD.exists("0")) {
        std::function<Settings(fs::File)> func = std::bind(&DataStore::settingsFromFile, this, std::placeholders::_1);
        return read("0", "", func);
    } else {
        Serial.println("Settings file not found; generating default settings.");

        Settings settings = getFactoryDefaultSettings();
        put(settings);
        return settings;
    }
}

void DataStore::deleteRegistration(std::string id) {
    SD.remove(("registrations/" + id).c_str());
}

void DataStore::deleteAllFeedings() {
    enumerateFiles<void*>("feedings", [](fs::File file){
        SD.remove(file.fullName());
        return nullptr;
    });
}

void DataStore::deleteAllSchedules() {
    enumerateFiles<void*>("schedules", [](fs::File file){
        SD.remove(file.fullName());
        return nullptr;
    });
}

void DataStore::deleteAllRegisteredDevices() {
    enumerateFiles<void*>("registrations", [](fs::File file){
        SD.remove(file.fullName());
        return nullptr;
    });
}

void DataStore::deleteSettings() {
    SD.remove("0");
    put(getFactoryDefaultSettings());
}

void DataStore::restoreToFactoryDefaults() {
    deleteAllFeedings();
    deleteAllSchedules();
    deleteAllRegisteredDevices();
    deleteSettings();
}

Feeding DataStore::feedingFromFile(fs::File file) {
    return Feeding {
        .id = std::string(file.name()),
        .cups = readBytesFromFile<float>(file),
        .date = readBytesFromFile<long>(file)
    };
}

Schedule DataStore::scheduleFromFile(fs::File file) {
    return Schedule {
        .id = std::string(file.name()),
        .cups = readBytesFromFile<float>(file),
        .hour = readBytesFromFile<uint8_t>(file),
        .minute = readBytesFromFile<uint8_t>(file)
    };
}

Registration DataStore::registrationFromFile(fs::File file) {    
    return Registration {
        .id = std::string(file.name()),
        .token = std::string(file.readStringUntil('\n').c_str()),
        .deviceType = std::string(file.readStringUntil('\n').c_str())
    };
}

Settings DataStore::settingsFromFile(fs::File file) {    

    Settings settings = Settings {
        .ssid = std::string(file.readStringUntil('\n').c_str()),
        .password = std::string(file.readStringUntil('\n').c_str()),
        .name = std::string(file.readStringUntil('\n').c_str())
    };

    char fcm[sizeof(Settings::fcm_fingerprint)];
    file.readBytes(fcm, sizeof(fcm));

    for(unsigned int i = 0; i < sizeof(fcm); i++) {
        settings.fcm_fingerprint[i] = (uint8_t)fcm[i];
    }

    return settings;
}

void DataStore::feedingToFile(Feeding feeding, fs::File file) {
    writeBytesToFile(file, feeding.cups);
    writeBytesToFile(file, feeding.date);
}

void DataStore::scheduleToFile(Schedule schedule, fs::File file) {
    writeBytesToFile(file, schedule.cups);
    writeBytesToFile(file, schedule.hour);
    writeBytesToFile(file, schedule.minute);
}

void DataStore::registrationToFile(Registration registration, fs::File file) {
    file.write(registration.token.c_str());
    file.write("\n");
    file.write(registration.deviceType.c_str());
    file.write("\n");
}

void DataStore::settingsToFile(Settings settings, fs::File file) {
    file.write(settings.ssid.c_str());
    file.write("\n");
    file.write(settings.password.c_str());
    file.write("\n");
    file.write(settings.name.c_str());
    file.write("\n");
    file.write(settings.fcm_fingerprint, sizeof(settings.fcm_fingerprint));
}

Settings DataStore::getFactoryDefaultSettings() {
    return Settings {
        .ssid = std::string(""),
        .password = std::string(""),
        .name = std::string("PetFeeder_"+random(9999)),
        .fcm_fingerprint = {0x41, 0x2a, 0x92, 0xb9, 0x66, 0x42, 0x21, 0xd6, 0xc9, 0x91, 0x39, 0x39, 0xc6, 0x03, 0x5b, 0x1d, 0x93, 0x0e, 0x0c, 0x50}
    };
}
