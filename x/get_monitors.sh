#!/bin/bash

IFS=$'\n\t'

MONINFO=$(xrandr -q | grep " connected")
MONS=()

for mon in $MONINFO; do
    MON=${mon%%\ connected*}
    MONS+=("$MON")
done

MONNUM=${#MONS[*]}

echo "$MONNUM"
echo "$MONS"

if [ $MONNUM -eq 1 ]; then
    echo "single screen, should be easy"
    exit 1
else if [ $MONNUM -eq 2 ]; then
    echo "Two screens, check if we are laptop"
else if [ $MONNUM -eq 3 ]; then
    echo "Three screens, triangle"
fi
exit 0
