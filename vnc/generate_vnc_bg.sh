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
FONT="Terminus-(TTF)-Bold"
FONTSIZE=100

echo 'text 0,0"' > bg.txt
echo $HOSTNAME >> bg.txt
echo '  VNC  ' >> bg.txt
echo '"' >> bg.txt

convert -size $SIZE xc:blue4 -font $FONT -pointsize $FONTSIZE -gravity Center -fill grey -draw @bg.txt image.png
