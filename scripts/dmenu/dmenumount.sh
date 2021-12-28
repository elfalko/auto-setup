#!/bin/bash
# https://www.youtube.com/watch?v=YOpeXETS2z0

# check if dmenu lives
pgrep -x dmenu && exit 

# --list --pairs | match part at end of line (so unmounted) | print 1. and 4. col (and brackets)
mountable=$(lsblk -lp | grep "part\s\+$" | awk '{print $1, "[" $4 "]"}')
# check if empty
[ -z "$mountable" ] && exit 1
# push into dmenu, -p prompt, -i case insensitive
chosen=$(echo "$mountable" | dmenu -i -p "Mount:" | awk '{print $1}')
[ -z "$chosen" ] && exit 1

pgrep -x dunst && notify-send "$(udisksctl mount -b $chosen)" 
