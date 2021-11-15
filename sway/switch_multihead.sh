#!/bin/bash

# script to switch dual screen setup
# while possible to do so with just config, this allows switching back and forth

SEPARATOR="-"
PRIMARY="-1"
SECONDARY="-2"
TMPFILE=~/.swaywsstuff

WS_CURRENT=$(swaymsg -t get_workspaces | jq --raw-output '.[] | try select(.focused == true) | .name')
WS_CURRENT="${WS_CURRENT%-*}"
WS_LAST=$(cat $TMPFILE)

echo "Requested WS $1"

if [ $1 == $WS_CURRENT ]; then
    echo "current ws $WS_CURRENT matches, going to last $WS_LAST"
    swaymsg "workspace $WS_LAST-1; workspace $WS_LAST-2"
else
    echo "going to $1"
    swaymsg "workspace $1-1; workspace $1-2"
fi

echo $WS_CURRENT>$TMPFILE
