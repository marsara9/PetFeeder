# PetFeeder ESP-IDF firmware

This is the fresh ESP32 firmware workspace. The original PlatformIO/Arduino implementation remains in `../code` as a reference.

## Prerequisites

Install ESP-IDF and source its environment in the shell. For example:

```sh
. "$HOME/esp/esp-idf/export.sh"
```

The project currently targets the classic ESP32 (`esp32`). Change the target before configuring if the physical board is an ESP32 variant such as S3, C3, or C6.

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

The firmware expects a FAT-formatted card with a text file at `wifi.conf` in the card root:

```text
ssid=your-network-name
password=your-network-password
```

If the card cannot be mounted, the file is missing, or `ssid` is empty, the firmware starts the `PetFeeder-Setup` access point instead. The current implementation keeps the card mounted for future datastore features.
