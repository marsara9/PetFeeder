#include "activityHistory.h"

#include <EEPROM.h>
#include <SPI.h>
#include <SD.h>

ActivityHistory::ActivityHistory() {
    this->hasSDCard = SD.begin(4);
}

template<typename T> void writeBytesToFile(File file, T data) {
    union {
        T data;
        char bytes[sizeof(T)];
    } converter;

    converter.data = data;

    file.print(converter.bytes);
}

template<typename T> T readBytesFromFile(File file) {
    union {
        T data;
        char bytes[sizeof(T)];
    } converter;

    file.readBytes(&converter.bytes, sizeof(T));

    converter.bytes = bytes;

    return converter.data;
}

void ActivityHistory::put(Feeding feeding) {
    if(hasSDCard) {
        char* filename = strcat("feeding-", feeding.id);
        SD.remove(filename);
        File file = SD.open(filename, FILE_WRITE);
        if(file) {

            writeBytesToFile(file, feeding.cups);
            writeBytesToFile(file, feeding.date);

            file.close();
        }
    } else {
        // TODO: Write to EEPROM
    }
}

void ActivityHistory::put(Schedule schedule) {
}

void ActivityHistory::put(Settings) {

}

void ActivityHistory::getAll(Feeding*, int size) {

}

void ActivityHistory::getAll(Schedule*, int size) {

}

Feeding ActivityHistory::getFeeding(const char* id) {

}

Schedule ActivityHistory::getSchedule(const char* id) {

}

Settings ActivityHistory::getSettings() {

}

void ActivityHistory::deleteAllFeedings() {

}

void ActivityHistory::deleteAllSchedules() {

}

void ActivityHistory::deleteSettings() {

}

void ActivityHistory::restoreToFactoryDefaults() {

}
