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

    fs::File root = SD.open(folder.c_str());
    fs::File file = root.openNextFile();
    while(file) {
        vector.push_back(read(file));
        
        file.close();
        file = root.openNextFile();
    }

    root.close();

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

std::vector<Feeding> DataStore::getAllFeedings() {
    std::function<Feeding(fs::File)> func = std::bind(&DataStore::feedingFromFile, this, std::placeholders::_1);
    return enumerateFiles("feedings", func);
}

std::vector<Schedule> DataStore::getAllSchedules() {
    std::function<Schedule(fs::File)> func = std::bind(&DataStore::scheduleFromFile, this, std::placeholders::_1);
    return enumerateFiles("schedules", func);
}

Feeding DataStore::getFeeding(std::string id) {
    std::function<Feeding(fs::File)> func = std::bind(&DataStore::feedingFromFile, this, std::placeholders::_1);
    return read(id, "feedings", func);
}

Schedule DataStore::getSchedule(std::string id) {
    std::function<Schedule(fs::File)> func = std::bind(&DataStore::scheduleFromFile, this, std::placeholders::_1);
    return read(id, "schedules", func);
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

void DataStore::deleteSettings() {
    SD.remove("0");
    put(getFactoryDefaultSettings());
}

void DataStore::restoreToFactoryDefaults() {
    deleteAllFeedings();
    deleteAllSchedules();
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
        .hour = readBytesFromFile<int>(file),
        .minute = readBytesFromFile<int>(file)
    };
}

Settings DataStore::settingsFromFile(fs::File file) {    
    return Settings {
        .ssid = std::string(file.readStringUntil('\n').c_str()),
        .password = std::string(file.readStringUntil('\n').c_str()),
        .name = std::string(file.readStringUntil('\n').c_str())
    };
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

void DataStore::settingsToFile(Settings settings, fs::File file) {
    file.write(settings.ssid.c_str());
    file.write("\n");
    file.write(settings.password.c_str());
    file.write("\n");
    file.write(settings.name.c_str());
}

Settings DataStore::getFactoryDefaultSettings() {
    return Settings {
        .ssid = std::string(""),
        .password = std::string(""),
        .name = std::string("ESP8266_"+random(9999))
    };
}
