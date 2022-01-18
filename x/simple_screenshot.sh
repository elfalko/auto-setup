#!/bin/bash
set -euxo pipefail

FILENAME="screenshot-`date +%Y%m%d-%H%M%S`"
FILEPATH="$1"
FILEFULL="$FILEPATH/$FILENAME.png"

mkdir -p "$FILEPATH"
import $FILEFULL
xclip -selection clipboard -target image/png $FILEFULL
notify-send --icon="$FILEFULL" "$FILENAME saved"
