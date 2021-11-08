#!/bin/bash

# grabs the wireless network name
INTERFACE="wlp2s0"
[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] ||
[[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]] && exit
ESSID=$(/sbin/iw dev $INTERFACE link | grep SSID | awk '{print $2}')

echo $ESSID # full text
echo $ESSID # short text
