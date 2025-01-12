#!/bin/bash

$PKG_MANAGER alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth apulse bluez bluez-utils
systemctl enable --now bluetooth.service
