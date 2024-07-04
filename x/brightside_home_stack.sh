#!/bin/bash

# Script to set all screens in Brightside home setup as well as possible
#
set -ux

xrandr --output eDP1 --auto \
    --output DP2-1 --auto --above eDP1 \
    --output DP2-2 --mode 1920x1080 --above DP2-1 || \
xrandr --output eDP1 --auto \
    --output DP1-1 --auto --above eDP1 \
    --output DP1-2 --mode 1920x1080 --above DP1-1
