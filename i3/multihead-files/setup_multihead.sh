#!/bin/bash

# script to autogenerate parallel workspaces for all monitors
# should be called by i3 config

source ~/auto-setup/sway/ws_config.sh

if [ -z $SWAYSOCK ]; then
    WM_MSG=i3-msg
else
    WM_MSG=swaymsg
fi

WS_NAMES=$1
# for testing
# MON_NAMES=( $2 )
# MON_NUM=3
MON_NUM=$(. ~/auto-setup/x/count_monitors.sh)
MON_NAMES=( $(. ~/auto-setup/x/get_monitor_names.sh) )

$WM_MSG "workspace_auto_back_and_forth no;"

CMD=""
for WS_NAME in $WS_NAMES
do
    # set up commands for control
    # assumes single character ws names [0-9a-z] as it sets them as the access key as well 
    # TODO more control via menu which allows sending to specific screens?
    CMD="${CMD}bindsym \$mod+$WS_NAME exec \$cmd_switch_multihead  $WS_NAME;"
    CMD="${CMD}bindsym \$mod+shift+$WS_NAME exec \$cmd_move_multihead  $WS_NAME;"
    for (( WS_C=1; WS_C<=$MON_NUM; WS_C++ ))
    do
        let I=$WS_C-1
        CMD="${CMD}workspace $WS_NAME$SEPARATOR$WS_C output ${MON_NAMES[$I]};"
    done
done

# echo $CMD
$WM_MSG "$CMD"
