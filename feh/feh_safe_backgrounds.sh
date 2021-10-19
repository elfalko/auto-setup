#!/bin/bash

# set a fancy background on the home screen
# and a normal one on all attached

feh --no-fehbg --auto-rotate --bg-max \
    $(find -L /home/f/pics/wallpapers | sort -R | tail -1) /home/f/projects/falkbrand/logo2whiteonblack.png /home/f/projects/falkbrand/logo2whiteonblack.png 
