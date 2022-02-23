#!/bin/bash

set -exo pipefail

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

TARGET="$1"

if [ -d $TARGET ]; then
    echo "found directory"
    ENTRIES="$(ls -A $1)"
else if [ -f $TARGET ]; then
    echo "found file"
    ENTRIES="$(cat $TARGET)"
else
    echo "$TARGET is neither file nor directory, can't handle this"
    print_help
    exit 1
fi

echo "Entries:"
echo "$ENTRIES"

[ -z "$ENTRIES" ] && exit 1

if [ ${#ENTRIES[@]} -eq 1 ]; then 
    CHOSEN="$ENTRIES"
else
    CHOSEN=$(echo "$ENTRIES" | dmenu -i -p "Options:")
fi

echo "$TARGET/$CHOSEN"
