#!/bin/bash

set -eo pipefail

print_help(){
    echo "Dmenu file selection"
    echo "  depends on dmenu"
    echo
    echo "Usage"
    echo "  $0 FILEPATH"
    echo 
    echo " FILEPATH e.g. ~/.local/share/remmina/*.remmina"
    echo
}

if [ $# -lt 1 ]; then
    print_help
    exit 1
fi

# check if dmenu lives
pgrep -x dmenu && exit 1

TARGET=$1
CHOSEN=""


if [ $(ls -1 $TARGET | wc -l) -eq 1 ]; then
    CHOSEN=$(ls -1 $TARGET)
else
    CHOSEN=$(ls $TARGET | dmenu -i -p "Options:")
fi

echo "$TARGET/$CHOSEN"
