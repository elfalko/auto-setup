#!/bin/bash

MYKBD="custom"

#moves file from this folder into system keyboard layouts
setxkbmap -v $MYKBD -option terminate:ctrl_alt_bksp


