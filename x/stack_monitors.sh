#!/bin/bash
#
# retrieves all connected monitors
#
# set -ux

MONS=$(xrandr -q | grep " connected" | sed -e "s/ con[^\n]*/ /;s/\n//")

LAST_MON=""
MODE="--auto"
# MODE="--mode 1920x1080"
CMD="xrandr"
for MON in $MONS 
do
    if [ -z $LAST_MON ]; then
        CMD="$CMD --output $MON $MODE"
        echo "$MON is main monitor"
    else
        CMD="$CMD --output $MON $MODE --above $LAST_MON"
        echo "Setting $MON above $LAST_MON"
    fi
    LAST_MON=$MON
done
echo $CMD
$CMD
