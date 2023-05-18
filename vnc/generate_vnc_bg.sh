#!/bin/bash

# set -euxo pipefail

# print_help(){
#     echo "Test script"
#     echo
#     echo "Usage"
#     echo "  $0 ARG1 [ARG2]"
# }

# if [ ! $# -le 1 ]; then
#     print_help
#     exit 1
# fi

SIZE=1920x1080
FONT=""

find_font(){
    echo $(convert -list font | grep $1)
}

# Try some nicer fonts
# TODO: check this in a loop
# if ! [ -z $(find_font "Terminus-(TTF)-Bold") ]; then 
#     echo "selecting font 1"
#     FONT="-font Terminus-(TTF)-Bold"
# elif ! [ -z $(find_font "Terminus-(TTF)") ]; then 
#     echo "selecting font 2"
#     FONT="-font Terminus-(TTF)"
# elif ! [ -z $(find_font "Ubuntu-Bold") ]; then 
#     echo "selecting font 3"
    FONT="-font Ubuntu-Bold"
# fi

FONTSIZE=100

TEXT="$HOSTNAME\r\n< VNC >"
OUTPATH="/tmp"

# -font $FONT
convert -size $SIZE xc:blue4 -pointsize $FONTSIZE $FONT -gravity Center -fill grey -annotate 0,0 "$TEXT" $OUTPATH/vnc_bg.png
