#include "activityHistory.h"

#include <EEPROM.h>
#include <SPI.h>
#include <SD.h>

ActivityHistory::ActivityHistory() {

}

void ActivityHistory::put(Feeding feeding) {

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
