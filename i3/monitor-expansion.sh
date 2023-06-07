#!/bin/bash

# script to move windows single monitor to multi monitor setups or back
# x-y to x
# x to x-1
source ~/auto-setup/sway/ws_config.sh

if [ -z $SWAYSOCK ]; then
    WM_MSG=i3-msg
else
    WM_MSG=swaymsg
fi

# get all workspaces
WS_ALL=($($WM_MSG -t get_workspaces | jq --raw-output '.[].name'))

# check how many monitors we have
MON_NUM=$(. $HOME/auto-setup/x/count_monitors.sh)

echo ""
for WS in "${WS_ALL[@]}"
do
    if [ $MON_NUM -gt 1 ]; then
        case "$WS" in
          *$SEPARATOR*) continue ;;
          *) WS_NEW="$WS${SEPARATOR}1" ;;
        esac
    else
        case "$WS" in
          *$SEPARATOR*) WS_NEW=${WS%%$SEPARATOR*} ;;
          *) continue ;;
        esac
    fi
    CMD="workspace $WS,"
    # dirty fix, I hardly ever use more than 4 windows per workspace
    for i in {1..4}; do
        CMD="$CMD move container to workspace $WS_NEW,"
    done
    # echo $CMD
    $WM_MSG $CMD
done

$WM_MSG "workspace $WS_NEW"
