#!/bin/bash

# script to switch dual screen setup
# * remembers which side you are currently on
# * can handle auto-back-and-forth or go to unfocused side on repress
# 
# requires jq 

source ~/auto-setup/sway/ws_config.sh

if [ -z $SWAYSOCK ]; then
    WM_MSG=swaymsg
else
    WM_MSG=i3-msg
fi

AUTO_BACK_AND_FORTH=true

WS_CURRENT=$($WM_MSG -t get_workspaces | jq --raw-output '.[] | try select(.focused == true) | .name')
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
        # echo "current ws $WS_CURRENT matches, going to last $WS_LAST"
        # echo "workspace $WS_LAST$WS_CURRENT_SIDE_UNFOCUSED; workspace $WS_LAST$WS_CURRENT_SIDE_FOCUSED"
        $WM_MSG "workspace $WS_LAST$WS_CURRENT_SIDE_UNFOCUSED; workspace $WS_LAST$WS_CURRENT_SIDE_FOCUSED"
    else
        # echo "current ws $WS_CURRENT matches, going to other screen $WS_CURRENT_SIDE_UNFOCUSED"
        $WM_MSG "workspace $1$WS_CURRENT_SIDE_UNFOCUSED"
    fi
else
    # echo "going to $1"
    # echo "workspace $1$WS_CURRENT_SIDE_UNFOCUSED; workspace $1$WS_CURRENT_SIDE_FOCUSED"
    $WM_MSG "workspace $1$WS_CURRENT_SIDE_UNFOCUSED; workspace $1$WS_CURRENT_SIDE_FOCUSED"
fi

echo $WS_CURRENT>$TMPFILE
