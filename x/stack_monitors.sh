#!/bin/bash
#
# retrieves all connected monitors
#
# set -ux

ALLMONS=$(xrandr -q | grep "connected" | sed -e "s/ [dis]*con[^\n]*/ /;s/\n//")
# space before connected filters out active monitors
MONS=$(xrandr -q | grep " connected" | sed -e "s/ con[^\n]*/ /;s/\n//")

LAST_MON=""
MODE="--auto"
OFFMODE="--off"
PRI_MON=""

# MODE="--mode 1920x1080"
CMD="xrandr"

echo "shutting down all detected monitors just in case"

for MON in $ALLMONS
do
    if [ -z $LAST_MON ]; then
        CMD="$CMD --output $MON $MODE"
        echo "$MON is main monitor"
        PRI_MON=$MON
    else
        CMD="$CMD --output $MON $OFFMODE"
        echo "Turning off $MON"
    fi
    LAST_MON=$MON
done

echo $CMD
$CMD

echo "setting up all detected monitors"

CMD="xrandr"

for MON in $MONS
do
    if [ "$MON" = "$PRI_MON" ]; then
        CMD="$CMD --output $MON $MODE"
        echo "$MON is main monitor"
        PRI_MON=$MON
    else
        CMD="$CMD --output $MON $MODE --above $LAST_MON"
        echo "Setting $MON above $LAST_MON"
    fi
    LAST_MON=$MON
done

echo $CMD
$CMD
