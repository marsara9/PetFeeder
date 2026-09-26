# PetFeeder ESP-IDF firmware

This is the fresh ESP32 firmware workspace. The original PlatformIO/Arduino implementation remains in `../code` as a reference.

## Architecture

The application entry point in `main.c` composes the firmware services. `datastore.c` owns SD-card mounting and file formats. `wifi.c` owns station/AP behavior and does not depend on the datastore. `wifi_credentials.h` contains only the shared credential value type used between those services.

Keep hardware and persistence details behind their service boundaries as additional features are ported. Scheduling, motor control, HTTP, and notifications should become separate services rather than being added to `main.c` or coupled directly to the SD implementation.

Feeding-history retention defaults are defined in `datastore_config.h`: 365 days and 1,000 entries. They are compile-time policy defaults for now and can later move into persisted settings without changing the feeding model or datastore API.

## Prerequisites

Install ESP-IDF and source its environment in the shell. For example:

```sh
. "$HOME/esp/esp-idf/export.sh"
```

The GPIO mapping is selected at compile time from the ESP-IDF target in `main/board_pins.h`:

- `esp32` selects the HUZZAH32 (Product 3405) pinout.
- `esp32s3` selects the ESP32-S3 Feather (Product 5323) pinout.

Switch targets with `idf.py set-target esp32` or `idf.py set-target esp32s3` before building. The S3 board has 8 MB flash; update the flash-size setting in `menuconfig` when switching to it.

The current custom partition table gives the single factory application a 1.5 MiB partition. NVS and PHY calibration data remain reserved. This is an interim layout; it can later be replaced with an OTA table or an SD-card update layout without changing the application service boundaries.

Wi-Fi reconnects indefinitely after a connection has once succeeded. Wi-Fi power save is disabled for the current stability test, which improves responsiveness and can help with marginal links at the cost of higher power consumption.

## Build and flash

From this directory:

```sh
idf.py set-target esp32
idf.py build
idf.py -p /dev/ttyUSB0 flash monitor
```

Use the device path shown by the operating system in place of `/dev/ttyUSB0`. The firmware uses UART0 at 115200 baud. Type into the serial monitor and the device will echo the received bytes.

To flash an already-built image without opening the monitor:

```sh
idf.py -p /dev/ttyUSB0 flash
```

## GPIO wiring

Wire the SD card and TB6612 to the GPIOs for the selected ESP-IDF target. The target-specific pin definitions are in `main/board_pins.h`.

| Peripheral signal | HUZZAH32 (`esp32`) | ESP32-S3 Feather (`esp32s3`) |
| --- | --- | --- |
| SD CS | GPIO4 | GPIO18 |
| SD MOSI (DI) | GPIO16 | GPIO17 |
| SD MISO (DO) | GPIO17 | GPIO16 |
| SD CLK | GPIO18 | GPIO15 |
| Motor PWMB | GPIO13 | GPIO13 |
| Motor BIN2 | GPIO14 | GPIO12 |
| Motor BIN1 | GPIO27 | GPIO11 |
| Motor STBY | GPIO26 | GPIO10 |
| Motor AIN1 | GPIO25 | GPIO9 |
| Motor AIN2 | GPIO33 | GPIO6 |
| Motor PWMA | GPIO32 | GPIO5 |

The SD reader and TB6612 logic must use 3.3 V logic and share ground with the board. Connect the TB6612 motor supply to the 12 V regulator; the driver outputs connect to the NEMA-17 motor coils according to their coil pairs.

The firmware expects a FAT-formatted card with a text file named `wifi` in the card root:

```text
ssid=your-network-name
password=your-network-password
```

If the card cannot be mounted, the file is missing, or `ssid` is empty, the firmware starts the `PetFeeder-Setup` access point instead. The current implementation keeps the card mounted for future datastore features.

## Settings API

The initial HTTP service exposes the settings endpoint on port 80:

```text
GET /settings
PUT /settings?ssid=network-name&password=network-password
```

The GET response contains the SSID but never the password. A successful PUT returns `204 No Content` and saves the credentials to the SD card. The new credentials are used after the next reboot; Wi-Fi reconfiguration during a request will be added when the connection lifecycle is formalized.

Schedules use Android-created UUIDs and are stored as individual files under `/sdcard/schedules/`:

```text
GET /schedule
PUT /schedule/uuid?cups=0.125&time=08:30
DELETE /schedule/uuid
```

The schedule PUT requires a UUID-shaped path ID, is idempotent, and returns `204 No Content`. The firmware does not generate or replace the ID.

Feeding history is stored in `/sdcard/feedings` and is recorded when a scheduled event fires. It is retained for `DATASTORE_FEEDING_RETENTION_DAYS` days and capped at `DATASTORE_MAX_FEEDINGS` entries. The history endpoint returns UTC timestamps:

```text
GET /feed
POST /feed?cups=0.125
```

Example response:

```json
[{"id":"feeding-uuid","cups":0.125,"date":"2026-09-19T20:12:00Z"}]
```

`POST /feed` records the feeding, starts the motor in a background task, and returns the new feeding record with `200 OK` without waiting for the rotation to finish. Only one motor operation is accepted at a time; a request made while the motor is busy is rejected.

When a schedule fires, the firmware currently logs an event over UART. All schedule times are UTC. For a quick test, calculate the next UTC minute and send:

```sh
curl -X PUT "http://DEVICE_IP/schedule/550e8400-e29b-41d4-a716-446655440000?cups=0.125&time=HH:MM"
```

After SNTP synchronization, the monitor should show `Scheduled event fired` at that UTC time.

## Time and scheduling

`timekeeper.c` synchronizes the ESP32 clock through SNTP and treats all firmware times as UTC. `scheduler.c` owns recurring daily events and runs them from its own FreeRTOS task, independent of the HTTP and datastore services. Android is responsible for converting user-local times to UTC before saving schedules.
