#!/bin/bash

MYKBD="custom"
SYSKBDS="/usr/share/X11/xkb/symbols/"

#moves file from this folder into system keyboard layouts
cp $SYSKBDS$MYKBD ./$MYKBD.old || echo "No custom keyboard seems to exist in $SYSKBDS$MYKBD" 
sudo cp $MYKBD $SYSKBDS$MYKBD
setxkbmap -v $MYKBD


