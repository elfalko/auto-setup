#!/bin/bash

# returns the number of connected montitors

# space before connected removes any `disconnected` results
# * searches for really used ones
# xrandr -q | grep -A1 " connected" | grep "*" | wc -l
if [ "$1" == "--connected" ]; then
    xrandr -q | grep " connected " | wc -l
else
    xrandr -q | grep "*" | wc -l
fi
