# PetFeeder project guidance

This repository contains a multi-part pet feeder project made up of separate subsystems that are intentionally kept in different folders:

- `code/` — firmware for the feeder itself
- `android/` — Android companion app that talks to the feeder hardware
- `circuit/` — circuit board design assets and BOM; currently mostly a hardware parts list
- `3dprint/` — printable enclosure and mechanical parts
- `api/` — API examples and collection files

## High-level architecture

### Firmware (`code/`)
- Built with PlatformIO.
- Uses the Arduino framework for an ESP8266-based board (`huzzah` target in `code/platformio.ini`).
- Main runtime entry point is `code/src/main.cpp`.
- Firmware responsibilities currently include:
  - Wi-Fi configuration and connection
  - local web server endpoints for settings and feeding control
  - stepper motor control for dispensing food
  - scheduled feed events
  - timekeeping and NTP-based scheduling
  - SD-card-backed datastore and persisted settings
  - FCM push notification support
- There is a legacy codebase here, so prefer compatibility and minimal disruption over large architectural rewrites unless the task explicitly calls for modernization.

### Android app (`android/`)
- Android project using Gradle and Kotlin.
- Uses Firebase messaging and AndroidX libraries.
- Companion app for interacting with and configuring the feeder over the network.
- Current build target is older Android API level setup (`compileSdkVersion 32`, `targetSdkVersion 32`), but the project may be upgraded later as part of a modernization pass.

### Hardware (`circuit/` and `3dprint/`)
- `circuit/bom.txt` lists the current BOM for breakout boards and hardware components.
- `3dprint/` contains the actual printable feeder hardware: the food hopper, dispensing chute, bowl, and the enclosure for the electronics.
- The entire physical structure is 3D printed, not a mixed metal/plastic enclosure; this includes the external housing and all functional feed components.
- This project combines custom mechanical parts, a control board, and a companion app rather than a single monolithic app.

## Repository conventions to preserve

- Keep subsystem boundaries clear: firmware changes should stay in `code/`, Android changes in `android/`, and hardware changes in `circuit/` or `3dprint/`.
- This is an older project; aim for incremental, safe improvements rather than sweeping refactors unless explicitly requested.
- Prefer existing project patterns and older library compatibility over introducing modern frameworks or tooling in unrelated areas.
- Assume that device communication, scheduling, and persistence logic are already important project behaviors and should be preserved unless the task is specifically about modernization.

## Typical task guidance

When making changes:
- Read the relevant firmware or app module before editing.
- Keep changes scoped to the subsystem being touched.
- If the task affects both firmware and app behavior, update both sides consistently and keep API compatibility in mind.
- For firmware work, check `code/platformio.ini` and the `code/include` / `code/src` modules first.
- For Android work, start in the Kotlin app modules under `android/app/src/main/java/com/sdoras/petfeeder`.

## Notes for future modernization

- The project is an older embedded + Android stack and is likely to need gradual modernization in the future.
- Short-term modernization goals are to move to a current Android SDK, switch from the ESP8266 to an ESP32, and move away from PlatformIO/Arduino where feasible.
- The overall design should remain stable: there is no central server for this project; scheduling and local app/device state are kept on the feeder itself.
- Keep the device-side data model and pairing flow compatible with Android-driven configuration and local persistence.
- If modernization is requested, handle it in staged updates instead of a single risky rewrite.

## Project-specific reminder

The feeder is not just a single-device app; it is a hybrid system made of:
1. embedded firmware on a Wi-Fi enabled board,
2. a mobile companion app,
3. custom 3D printed mechanical parts that form the full feeder body and dispensing components.

All persistent data and scheduling logic are intended to remain on-device, with the Android app acting as the user-facing control surface rather than a cloud-backed service.
