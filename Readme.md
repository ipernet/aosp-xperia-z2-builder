# AOSP

Dockerfile for building Android Nougat 7.1 (kernel/ramdisk/bootimg/aosp) for Sony Xperia Z2 devices (d6503).

Implements the official build instructions provided by [Sony Open devices](https://developer.sonymobile.com/open-devices/aosp-build-instructions/how-to-build-aosp-nougat-for-unlocked-xperia-devices/).

# Usage

- Download the [AOSP Nougat (Android 7.1) binaries for Xperia™ Z2](https://developer.sonymobile.com/open-devices/list-of-devices-and-resources/) zip file in `deps/`

- Build the Docker image:

`docker build -t you/aosp-d6503-builder:latest .`

# Output

`/android/out/target/product/sirius/boot.img`

# Flashing

Standard flash method on a unlocked device in bootloader mode using Android Platform Tools:

- `fastboot devices` > should return your device.
- `fastboot flash boot boot.img`
- `fastboot reboot`

# Sources

- https://developer.sonymobile.com/open-devices/aosp-build-instructions/how-to-build-aosp-nougat-for-unlocked-xperia-devices/
- https://github.com/SonyAosp/kernel.git / https://github.com/rcstar6696/kernel.git

# Copyright / credits

- AOSP Sony Open Devices binaries and configurations: [`Copyright (C) Sony Mobile Communications 2014`](https://github.com/SonyAosp/device_sony_sirius/blob/android-7.1/README.md)
- The Linux Kernel:  [GNU General Public License v2](https://github.com/SonyAosp/kernel/blob/android-7.1/COPYING)
- [rcstar6696](https://github.com/rcstar6696/kernel) patches.