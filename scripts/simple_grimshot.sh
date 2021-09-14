#!/bin/bash
FILENAME="screenshot-`date +%Y%m%d-%H%M%S`"
FILEPATH="$HOME/Downloads/screenshots"
FILEFULL="$FILEPATH/$FILENAME.png"

mkdir -p "$FILEPATH"
grim -g "$(slurp)" $FILEFULL
wl-copy < $FILEFULL
