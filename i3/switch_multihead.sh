#!/bin/bash

# script to switch dual screen setup
# * remembers which side you are currently on
# * can handle auto-back-and-forth or go to unfocused side on repress
# 
# requires jq 

source ~/auto-setup/sway/ws_config.sh

if [ -z $SWAYSOCK ]; then
    WM_MSG=i3-msg
else
    WM_MSG=swaymsg
fi

WS_CURRENT=$($WM_MSG -t get_workspaces | jq --raw-output '.[] | try select(.focused == true) | .name')
WS_CURRENT_SIDE_FOCUSED=$SEPARATOR${WS_CURRENT##*$SEPARATOR}
WS_CURRENT="${WS_CURRENT%$SEPARATOR*}"

mkdir -p $TMPDIR
if [ -f $TMPFILE ]; then
    WS_LAST=$(cat $TMPFILE)
fi

WS_NUM=$(xrandr -q | grep " connected" | wc -l)

WS_NEW=$1
if [ $WS_NEW == $WS_CURRENT ]; then
    WS_NEW=$WS_LAST
fi

#idea: call all workspaces, then call focused again
CMD=""

for WS_MON in {1..$WS_NUM}
do
    CMD="${CMD}workspace $WS_NEW$WS_NUM;"
done

CMD="${CMD}workspace $WS_NEW$WS_CURRENT_SIDE_FOCUSED;"
$WM_MSG "$CMD"

echo $WS_CURRENT>$TMPFILE
