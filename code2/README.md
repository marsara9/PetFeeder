# PetFeeder ESP-IDF firmware

This is the fresh ESP32 firmware workspace. The original PlatformIO/Arduino implementation remains in `../code` as a reference.

## Architecture

The application entry point in `main.c` composes the firmware services. `datastore.c` owns SD-card mounting and file formats. `wifi.c` owns station/AP behavior and does not depend on the datastore. `wifi_credentials.h` contains only the shared credential value type used between those services.

Keep hardware and persistence details behind their service boundaries as additional features are ported. Scheduling, motor control, HTTP, and notifications should become separate services rather than being added to `main.c` or coupled directly to the SD implementation.

## Prerequisites

Install ESP-IDF and source its environment in the shell. For example:

```sh
. "$HOME/esp/esp-idf/export.sh"
```

The project currently targets the classic ESP32 (`esp32`). Change the target before configuring if the physical board is an ESP32 variant such as S3, C3, or C6.

The current custom partition table gives the single factory application a 1.5 MiB partition. NVS and PHY calibration data remain reserved. This is an interim layout; it can later be replaced with an OTA table or an SD-card update layout without changing the application service boundaries.

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

## SD card wiring

Use the ESP32 VSPI pins for the SD card reader:

| SD reader | ESP32 | Signal |
| --- | --- | --- |
| CLK | GPIO18 | SPI clock |
| DO | GPIO19 | MISO, card to ESP32 |
| DI | GPIO23 | MOSI, ESP32 to card |
| CS | GPIO5 | Chip select |
| VCC | 3.3V | Use 3.3 V logic |
| GND | GND | Common ground |

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

When a schedule fires, the firmware currently logs an event over UART. All schedule times are UTC. For a quick test, calculate the next UTC minute and send:

```sh
curl -X PUT "http://DEVICE_IP/schedule/550e8400-e29b-41d4-a716-446655440000?cups=0.125&time=HH:MM"
```

After SNTP synchronization, the monitor should show `Scheduled event fired` at that UTC time.

## Time and scheduling

`timekeeper.c` synchronizes the ESP32 clock through SNTP and treats all firmware times as UTC. `scheduler.c` owns recurring daily events and runs them from its own FreeRTOS task, independent of the HTTP and datastore services. Android is responsible for converting user-local times to UTC before saving schedules.
