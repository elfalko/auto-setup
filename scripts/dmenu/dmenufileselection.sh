#!/bin/bash

set -eo pipefail

print_help(){
    echo "Dmenu file selection"
    echo "  depends on dmenu"
    echo
    echo "Usage"
    echo "  $0 DIR"
    echo
}

if [ $# -lt 1 ]; then
    print_help
    exit 1
fi

# check if dmenu lives
pgrep -x dmenu && exit 1

TARGET=$1

ENTRIES=$(ls -A $1)

[ -z "$ENTRIES" ] && exit 1

if [ ${#ENTRIES[@]} -eq 1 ]; then 
    CHOSEN=$ENTRIES
else
    CHOSEN=$(echo "$ENTRIES" | dmenu -i -p "Options:")
fi

echo "$TARGET/$CHOSEN"
