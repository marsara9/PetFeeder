#include "dataStore.h"

#include <SPI.h>
#include <SD.h>

DataStore::DataStore() {

}

bool DataStore::begin() {
    //SPI.pins(14, 12, 13, 16);
    SPI.begin();

    pinMode(16, OUTPUT);
    return SD.begin(16);
}

template<typename T> T DataStore::readBytesFromFile(File file) {
    union {
        T data;
        char bytes[sizeof(T)];
    } converter;

    file.readBytes(converter.bytes, sizeof(T));

    return converter.data;
}

template<typename T> void DataStore::writeBytesToFile(File file, T data) {
    union {
        T data;
        char bytes[sizeof(T)];
    } converter;

    converter.data = data;

    file.print(converter.bytes);
}

template<typename T> std::vector<T> DataStore::enumerateFiles(std::string folder, std::function<T(File)> read) {
    std::vector<T> vector;

    File root = SD.open(folder.c_str());
    File file = root.openNextFile();
    while(file) {
        vector.push_back(read(file));
        
        file.close();
        file = root.openNextFile();
    }

    root.close();

    return vector;
}

template<typename T> T DataStore::read(std::string id, std::string folder, std::function<T(File)> read) {
    std::string filename = folder + "/" + id;
    File file = SD.open(filename.c_str(), FILE_READ);
    T result = read(file);
    file.close();
    return result;
}

template<typename T> void DataStore::save(T item, std::string id, std::string folder, std::function<void(T, File)> write) {
    std::string filename = folder + "/" + id;
    SD.remove(filename.c_str());
    File file = SD.open(filename.c_str(), FILE_WRITE);
    write(item, file);
    file.close();
}

void DataStore::put(Feeding feeding) {
    std::function<void(Feeding, File)> func = std::bind(&DataStore::feedingToFile, this, std::placeholders::_1, std::placeholders::_2);
    save(feeding, feeding.id, "feedings", func);
}

void DataStore::put(Schedule schedule) {
    std::function<void(Schedule, File)> func = std::bind(&DataStore::scheduleToFile, this, std::placeholders::_1, std::placeholders::_2);
    save(schedule, schedule.id, "schedules", func);
}

void DataStore::put(Settings settings) {
    std::function<void(Settings, File)> func = std::bind(&DataStore::settingsToFile, this, std::placeholders::_1, std::placeholders::_2);
    save(settings, "0", "", func);
}

std::vector<Feeding> DataStore::getAllFeedings() {
    std::function<Feeding(File)> func = std::bind(&DataStore::feedingFromFile, this, std::placeholders::_1);
    return enumerateFiles("feedings", func);
}

std::vector<Schedule> DataStore::getAllSchedules() {
    std::function<Schedule(File)> func = std::bind(&DataStore::scheduleFromFile, this, std::placeholders::_1);
    return enumerateFiles("schedules", func);
}

Feeding DataStore::getFeeding(std::string id) {
    std::function<Feeding(File)> func = std::bind(&DataStore::feedingFromFile, this, std::placeholders::_1);
    return read(id, "feedings", func);
}

Schedule DataStore::getSchedule(std::string id) {
    std::function<Schedule(File)> func = std::bind(&DataStore::scheduleFromFile, this, std::placeholders::_1);
    return read(id, "schedules", func);
}

Settings DataStore::getSettings() {
    if(SD.exists("0")) {
        std::function<Settings(File)> func = std::bind(&DataStore::settingsFromFile, this, std::placeholders::_1);
        return read("0", "", func);
    } else {
        Settings settings = getFactoryDefaultSettings();
        put(settings);
        return settings;
    }
}

void DataStore::deleteAllFeedings() {
    enumerateFiles<void*>("feedings", [](File file){
        SD.remove(file.fullName());
        return nullptr;
    });
}

void DataStore::deleteAllSchedules() {
    enumerateFiles<void*>("schedules", [](File file){
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

Feeding DataStore::feedingFromFile(File file) {
    return Feeding {
        .id = file.name(),
        .cups = readBytesFromFile<float>(file),
        .date = readBytesFromFile<long>(file)
    };
}

Schedule DataStore::scheduleFromFile(File file) {
    return Schedule {
        .id = file.name(),
        .cups = readBytesFromFile<float>(file),
        .hour = readBytesFromFile<int>(file),
        .minute = readBytesFromFile<int>(file)
    };
}

Settings DataStore::settingsFromFile(File file) {
    const char* ssid = file.readString().c_str();
    const char* password = file.readString().c_str();
    const char* name = file.readString().c_str();
    
    return Settings {
        .ssid = ssid,
        .password = password,
        .name = name
    };
}

void DataStore::feedingToFile(Feeding feeding, File file) {
    writeBytesToFile(file, feeding.cups);
    writeBytesToFile(file, feeding.date);
}

void DataStore::scheduleToFile(Schedule schedule, File file) {
    writeBytesToFile(file, schedule.cups);
    writeBytesToFile(file, schedule.hour);
    writeBytesToFile(file, schedule.minute);
}

void DataStore::settingsToFile(Settings settings, File file) {
    file.write(settings.ssid.c_str());
    file.write(settings.password.c_str());
    file.write(settings.name.c_str());
}

Settings DataStore::getFactoryDefaultSettings() {
    return Settings {
        .ssid = "",
        .password = "",
        .name = "ESP8266_"+random(9999)
    };
}
