#!/bin/bash

# set a fancy background across screens

PICFOLDER=$1
PIC=$(ls $1 | sort -R | tail -n 1)

# set terminal colors
setsid wal -i "$PICFOLDER/$PIC" 
# notify-send "$PICFOLDER/$PIC"
sleep 1s
# set background
feh --no-fehbg --auto-rotate --bg-max --no-xinerama "$PICFOLDER/$PIC"

