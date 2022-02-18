#!/bin/bash

# generate a wallpaper if necessary
# and set it

BGPATH=$HOME/auto-setup/vnc/vnc_bg.png

if [ ! -f $BGPATH ]; then
    /bin/bash $HOME/auto-setup/vnc/generate_vnc_bg.sh
fi

feh --no-fehbg --auto-rotate --bg-max $BGPATH
