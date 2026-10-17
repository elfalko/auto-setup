#!/bin/bash
FILENAME="screenshot-`date +%Y%m%d-%H%M%S`"
FILEPATH="$HOME/Downloads/screenshots"
FILEFULL="$FILEPATH/$FILENAME.png"

for cmd in grim slurp wl-copy; do
command -v $cmd>/dev/null 2>&1 || notify-send "$cmd not installed" || echo "$cmd not installed"
done

mkdir -p "$FILEPATH"
grim -g "$(slurp)" $FILEFULL
wl-copy < $FILEFULL
