#!/bin/bash

# el_falko

SEPARATOR="-"
TMPFILE="/tmp/i3-last-workspace"
TMPCONFIG="/tmp/i3-multihead.config"

MON_NUM=1

WS_NAMES="1 2 3 4 5"
WS_NEW="00"

WS_CURRENT="1"
DEBUG="0"

# edge cases: 
# - [x] single screen needs no suffix
# - [ ] specifc suffixes: 1-Mail
# - [ ] auto back and forth between ws with suffix and without
# - [ ] test on sway
# - [x] verbose param
# - [ ] path params

print_help(){
    echo "NAME"
    echo "  $0 - program to emulate multi-screen workspaces in i3 and sway"
    echo "SYNOPSIS"
    echo "  $0 [--verbose] CMD [WORKSPACE(S)]"
    echo "  $0 generate WORKSPACE [WORKSPACE ...]"
    echo "  $0 workspace WORKSPACE"
    echo "  $0 move WORKSPACE"
    echo "  $0 expand [maximum monitor number]"
    echo ""
    echo "COMMANDS"
    echo "  generate   create a temporary i3/sway config for active monitor setup"
    echo "  workspace  switch to chosen workspace"
    echo "  move       move current container to chosen workspace"
    echo "  expand     move current containers so they fit the new workspace naming"
    echo ""
    echo "  WORKSPACE  workspace name string."
    echo "             With several monitors, WS-1, WS-2, etc. will be used."
    echo ""
    echo "  --verbose  debug info"
    echo "  --help     print this help"
    echo ""
    echo "FEATURES"
    echo "* auto-adapt to number of screens"
    echo "* omits suffix for single screen setups"
    echo "* remembers currently focused monitor"
    echo "* handles moving correctly after switching active screen number"
    echo "* handles auto-back-and-forth (alternative: unfocused monitor)"
    echo ""
    echo "DEPENDENCIES"
    echo "  jq"
    exit 0
}

debug_msg(){
    if [ $DEBUG = "1" ]; then
        notify-send $1
        echo "$1"
    fi
}

wm_handler(){
    if [ -z $SWAYSOCK ]; then
        WM_MSG=i3-msg
    else
        WM_MSG=swaymsg
        debug_msg "Not tested for sway yet."
    fi
    debug_msg "WM_MSG $WM_MSG"
    get_monitor_number
}

get_monitor_number(){
    MON_NUM=$($WM_MSG -t get_outputs | jq -c '[ .[].name ] - ["xroot-0"] | .[]' | wc -l)
    debug_msg "MON_NUM $MON_NUM"
}

get_monitor_names(){
    MON_NAMES=( $($WM_MSG -t get_outputs | jq -cr '[ .[].name ] - ["xroot-0"] | @sh') )
    debug_msg "MON_NAMES $MON_NAMES"
}

get_current_workspace(){
    WS_CURRENT=$($WM_MSG -t get_workspaces | jq --raw-output '.[] | try select(.focused == true) | .name')

    # handle both "x-y" and "x" workspace names
    case "$WS_CURRENT" in
      *$SEPARATOR*) MON_FOCUS=${WS_CURRENT##*$SEPARATOR} ;;
      *)            MON_FOCUS="1" ;; # default (when attaching screen)
    esac

    WS_CURRENT="${WS_CURRENT%$SEPARATOR*}"
    debug_msg "WS_CURRENT $WS_CURRENT"
}

# must get called after get_current_workspace
# TODO probably always called together, so might be joined
get_last_workspace(){
    mkdir -p $(dirname $TMPFILE)
    if [ -f $TMPFILE ]; then
        WS_LAST=$(cat $TMPFILE)
    fi
    debug_msg "WS_LAST is $WS_LAST"

    # workspace back and forth
    if [ $WS_NEW == $WS_CURRENT ]; then
        WS_NEW=$WS_LAST
        debug_msg "manual auto_back_and_forth: WS_NEW is $WS_NEW"
    fi
}

# TODO reload i3 config?
# generates a file to be loaded by the i3 config
generate_multihead_setup(){
    get_monitor_names
    echo "# AUTOGENERATED BY $0" > $TMPCONFIG
    echo "workspace_auto_back_and_forth no" >> $TMPCONFIG

    echo "" >> $TMPCONFIG
    for WS_NAME in $WS_NAMES
    do
        # set up commands for control
        # assumes single character ws names [0-9a-z] as it sets them as the access key as well 
        # TODO more control via menu which allows sending to specific screens?
        echo "bindsym \$mod+$WS_NAME exec $0 workspace $WS_NAME" >> $TMPCONFIG
        echo "bindsym \$mod+shift+$WS_NAME exec $0 move $WS_NAME" >> $TMPCONFIG
        for (( WS_C=1; WS_C<=$MON_NUM; WS_C++ ))
        do
            let I=$WS_C-1
            echo "workspace $WS_NAME$SEPARATOR$WS_C output ${MON_NAMES[$I]}" >> $TMPCONFIG
        done
        echo "" >> $TMPCONFIG
    done
    echo "exec_always $0 workspace 1" >> $TMPCONFIG

    debug_msg "generating config $(cat $TMPCONFIG)"
}

# switch to a workspace
switch_multihead_view(){
    get_current_workspace
    get_last_workspace

    if [ $MON_NUM -gt 1 ]; then
        #idea: call all workspaces, then call focused again
        for (( MON_C=1; MON_C<=$MON_NUM; MON_C++ )); do
            if [ "-$MON_C" != $MON_FOCUS ]; then
                CMD="workspace $WS_NEW$SEPARATOR$MON_C;"
                debug_msg "switching workspace $CMD"
                $WM_MSG "$CMD"
            fi
        done

        CMD="workspace $WS_NEW$SEPARATOR$MON_FOCUS;"
    else
        CMD="workspace $WS_NEW"
    fi

    # notify-send "$CMD"
    # TODO fix this
    sleep 0.1
    $WM_MSG "$CMD"

    debug_msg "switching workspace $CMD"

    echo $WS_CURRENT>$TMPFILE
}

move_container_to_workspace(){
    get_current_workspace
    get_last_workspace

    MON_NUM=$(. $HOME/auto-setup/x/count_monitors.sh)
    if [ $MON_NUM -gt 1 ]; then
        CMD="move container to workspace $WS_NEW$SEPARATOR$MON_FOCUS;"
    else
        CMD="move container to workspace $WS_NEW;"
    fi

    $WM_MSG "$CMD"

    debug_msg "move container to workspace $CMD"
}

expand_to_multihead(){
    # get all workspaces
    WS_ALL=( $($WM_MSG -t get_workspaces | jq --raw-output '.[].name') )

    for WS in "${WS_ALL[@]}"
    do
        debug_msg "WS $WS"
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
        # dirty fix, I hardly ever use more than 4 windows per workspace
        for i in {1..4}; do
            CMD="$CMD move container to workspace $WS_NEW,"
            debug_msg "workspace $WS: $i - $CMD"
        done
        [ ! -z $CMD ] && $WM_MSG $CMD
    done

    [ ! $WS_NEW = "00" ] && $WM_MSG "workspace $WS_NEW"

    debug_msg "expand_to_multihead"
}

if [ $# -lt 1 ]; then 
    print_help; 
fi

wm_handler

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            print_help
            ;;
        -v|--verbose)
            DEBUG=1
            set -euxo pipefail
            shift
            ;;
        g|generate)
            WS_NAMES=$2
            shift
            shift
            generate_multihead_setup
            ;;
        ws|workspace|switch)
            WS_NEW=$2
            shift
            shift
            switch_multihead_view
            ;;
        mv|move)
            WS_NEW=$2
            shift
            shift
            move_container_to_workspace
            ;;
        e|expand)
            shift
            expand_to_multihead
            ;;
        -*|--*)
            echo "Unknown option $1"
            exit 1
            ;;
        *)
            POSITIONAL_ARGS+=("$1") # save positional arg
            shift # past argument
            ;;
    esac
done