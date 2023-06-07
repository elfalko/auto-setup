#!/bin/bash

# script to switch dual screen setup
# * remembers which side you are currently on
# * can handle auto-back-and-forth or go to unfocused side on repress
# 
# requires jq 
#
# edge cases: 
# - [x] single screen needs no suffix
# - [ ] specifc suffixes: 1-Mail
# - [ ] auto back and forth between ws with suffix and without

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

MON_NUM=$(. $HOME/auto-setup/x/count_monitors.sh)

WS_NEW=$1
if [ $WS_NEW == $WS_CURRENT ]; then
    WS_NEW=$WS_LAST
fi

if [ $MON_NUM -gt 1 ]; then
    #idea: call all workspaces, then call focused again
    for (( MON_C=1; MON_C<=$MON_NUM; MON_C++ )); do
        if [ "-$MON_C" != $MON_FOCUS ]; then
            CMD="workspace $WS_NEW$SEPARATOR$MON_C;"
            # notify-send "$CMD"
            $WM_MSG "$CMD"
        fi
    done

    CMD="workspace $WS_NEW$SEPARATOR$MON_FOCUS;"
else
    CMD="workspace $WS_NEW"
fi

# notify-send "$CMD"
sleep 0.1
$WM_MSG "$CMD"

echo $WS_CURRENT>$TMPFILE
