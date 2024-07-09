#!/bin/bash
BRIGHTNESSFILE=$(ls /sys/class/backlight/*/brightness)
MAXBRIGHTNESS=$(cat /sys/class/backlight/*/max_brightness)

if [[ "$1" == "max" ]]; then
  echo $MAXBRIGHTNESS > $BRIGHTNESSFILE
elif [[ "$1" == "min" ]]; then
  echo 1 > $BRIGHTNESSFILE
elif [[ "$1" =~ ^[+-][0-9]+$ ]]; then
  # echo "passing to bc: $(cat $BRIGHTNESSFILE)$1"
  echo "$(cat $BRIGHTNESSFILE)$1" | bc > $BRIGHTNESSFILE
elif [[ "$1" =~ ^[0-9]+$ ]]; then
  # echo "absolute value: $1"
  echo "$1" > $BRIGHTNESSFILE
else
  echo "$0    simple backlight brightness selector"
  echo "      assumes paths '/sys/class/backlight/<gpu_name>/{brightness|max_brightness}' exist"
  echo ""
  echo "  Usage:"
  echo "    $0 [mix|max|+<number>|-<number>|<number>]"
  echo ""
  echo "    min|max     set screenbrightness to 1 or the value in max_screenbrightness"
  echo "    +/-number   read current brightness and add/subtract number"
  echo "    number      set absolute brightness"
fi
echo "$(cat $BRIGHTNESSFILE)/$MAXBRIGHTNESS"
