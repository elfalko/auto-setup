#!/bin/bash

# opens feh with custom action scripts 
# 1 copy to good folder     a
# 2 copy to stitch folder   s
# 3 move to bad folder      d
# 4 resize for sending      f
# 5 rotate                  r
# 6 rotate other way        R

# also see ~/.config/feh/keys

feh --scale-down --draw-filename --draw-exif --auto-rotate \
    --action1 "~/auto-setup/feh/move_to_good.sh $PWD/%F" \
    --action2 "~/auto-setup/feh/move_to_stitch.sh $PWD/%F" \
    --action3 "~/auto-setup/feh/move_to_bad.sh $PWD/%F" \
    --action4 ";~/auto-setup/feh/resize_for_sending.sh $PWD/%F" \
    --action5 ";~/auto-setup/feh/rotate_clockwise.sh $PWD/%F" \
    --action6 ";~/auto-setup/feh/rotate_counterclockwise.sh $PWD/%F" \
    --start-at $1
    # -p \
