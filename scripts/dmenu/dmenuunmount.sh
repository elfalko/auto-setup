#!/bin/bash
# https://xspdf.com/resolution/57396607.html 
excluderegex="\(/boot\|/home\|/\)$"
mounted=$(lsblk -lp | grep "t\s\+/" | grep -v "$excluderegex" | awk '{print $1, "[" $4 "]", "on", $7}')
[ -z "$mounted" ] && exit 
chosen=$(echo "$mounted" | dmenu -i -p "Unmount:" | awk '{print $1}') 
[ -z "$chosen" ] && exit 

pgrep -x dunst && notify-send $(udisksctl unmount -b $chosen)
