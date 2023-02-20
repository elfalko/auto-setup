#!/bin/bash
#
# retrieves all connected monitors
#
# set -ux

MONS=$(xrandr -q | grep " connected" | sed -e "s/ con[^\n]*/ /;s/\n//")
echo $MONS
