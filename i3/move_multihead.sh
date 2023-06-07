#!/bin/bash

# script to move containers with multihead screen setup
# to same monitor on different workspace group
#
# example: bindsym $mod+Shift+1 move container to workspace  1-1
# will move from 3-1 to 3 and back if attaching/detaching monitors

source ~/auto-setup/sway/ws_config.sh

if [ -z $SWAYSOCK ]; then
    WM_MSG=i3-msg
else
    WM_MSG=swaymsg
fi

WS_CURRENT=$($WM_MSG -t get_workspaces | jq --raw-output '.[] | try select(.focused == true) | .name')

case "$WS_CURRENT" in
  *$SEPARATOR*) MON_FOCUS=${WS_CURRENT##*$SEPARATOR} ;;
  *)            MON_FOCUS="1" ;; # default (when attaching screen)
esac

WS_CURRENT="${WS_CURRENT%$SEPARATOR*}"

mkdir -p $TMPDIR
if [ -f $TMPFILE ]; then
    WS_LAST=$(cat $TMPFILE)
fi

WS_NEW=$1
if [ $WS_NEW == $WS_CURRENT ]; then
    WS_NEW=$WS_LAST
fi

#idea: move to same monitor, different ws

MON_NUM=$(. $HOME/auto-setup/x/count_monitors.sh)
if [ $MON_NUM -gt 1 ]; then
    CMD="move container to workspace $WS_NEW$SEPARATOR$MON_FOCUS;"
else
    CMD="move container to workspace $WS_NEW;"
fi

$WM_MSG "$CMD"
