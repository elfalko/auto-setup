#!/bin/bash

set -euxo pipefail

# set a fancy background on the home screen
# and a normal one on all attached

# BG_R=$FAUTOSETUP/wallpapers/right/tron_homemode_w1920_cw1920_ch1080_cx1920_cy0.jpg
# BG_L=$FAUTOSETUP/wallpapers/left/tron_homemode_w1920_cw1920_ch1080_cx0_cy0.jpg

# echo $BG_L $BG_R
# feh --no-fehbg --auto-rotate --bg-max \
#     $(find -L $HOME/setup/wallpapers | sort -R | tail -1) $BG_L $BG_R
# /usr/bin/feh --no-fehbg --auto-rotate --bg-max $BG_L $BG_R

/usr/bin/feh --no-fehbg --auto-rotate --bg-max ~/projects/cheatsheet/cheatsheet.jpg
