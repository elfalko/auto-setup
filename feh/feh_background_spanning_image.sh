#!/bin/bash

# set a fancy background on the home screen
# and a normal one on all attached

PICFOLDER=$1
PIC=$(ls $1 | sort -R | tail -n 1)

notify-send "$PICFOLDER/$PIC"
# set background
feh --no-fehbg --auto-rotate --bg-max --no-xinerama "$PICFOLDER/$PIC"
# set terminal colors
setsid wal -i "$PICFOLDER/$PIC"

