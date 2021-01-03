#!/bin/bash

# links to a resource file 
# $1: link target in resources ./resource/$1
# $2: name of link
echo "Trying to link $1 to $2"
if [ -f "$2" ]; then
    echo "- $2 exists, either delete or run"
    echo "    mv $2 $2.old"
else
    if [ -L "$2" ]; then
        echo "- link $1 already exists, done"
    else
        echo "- linking $1"
        ln -s "$(pwd)/resources/$1" "$2" 
    fi
fi


