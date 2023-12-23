#!/bin/bash

# links to a resource file 
# $1: link target in resources ./resource/$1
# $2: name of link

BACKUPNAME="$2.$($(which date) +%y%m%d-%H%M).old"
if [ -f "$2" ]; then
    echo "$2 exists, moved to $BACKUPNAME"
    mv $2 $BACKUPNAME
fi

if [ -L "$2" ]; then
    echo "link $2 already exists, moved to $BACKUPNAME"
    mv $2 $BACKUPNAME
fi

echo "linking $2 to $1"
ln -s "$1" "$2"


