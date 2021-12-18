#!/bin/bash

# script to switch dual screen setup
# * remembers which side you are currently on
# * can handle auto-back-and-forth or go to unfocused side on repress
# 
# requires jq 

source ~/auto-setup/sway/ws_config.sh

AUTO_BACK_AND_FORTH=true

WS_CURRENT=$(swaymsg -t get_workspaces | jq --raw-output '.[] | try select(.focused == true) | .name')
WS_CURRENT_SIDE_FOCUSED=$SEPARATOR${WS_CURRENT##*$SEPARATOR}
WS_CURRENT="${WS_CURRENT%$SEPARATOR*}"

mkdir -p $TMPDIR
if [ -f $TMPFILE ]; then
    WS_LAST=$(cat $TMPFILE)
fi

WS_CURRENT_SIDE_UNFOCUSED=$SECONDARY
if [ $WS_CURRENT_SIDE_FOCUSED == $WS_CURRENT_SIDE_UNFOCUSED ]; then
    WS_CURRENT_SIDE_UNFOCUSED=$PRIMARY
fi


if [ $1 == $WS_CURRENT ]; then
    if [ $AUTO_BACK_AND_FORTH == true ];then
        swaymsg "workspace $WS_LAST$WS_CURRENT_SIDE_UNFOCUSED; workspace $WS_LAST$WS_CURRENT_SIDE_FOCUSED"
    else
        swaymsg "workspace $1$WS_CURRENT_SIDE_UNFOCUSED"
    fi
else
    swaymsg "workspace $1$WS_CURRENT_SIDE_UNFOCUSED; workspace $1$WS_CURRENT_SIDE_FOCUSED"
fi

echo $WS_CURRENT>$TMPFILE
