#!/bin/bash

# These values are used in a monitor switching script for xrandr

###############################################################################
# FIX is currently disabled, see comments in previous and next
###############################################################################

#names for switching, and for display in i3 task bar
SETUP_FULL="stacked"
SETUP_FULL_REVERSED="reverse-stacked"
SETUP_TRIANGLE="triangle"
SETUP_TRIANGLE_REVERSED="reverse-triangle"
SETUP_FULL_FIX="full-fix"
SETUP_EXTERNAL="external"
SETUP_EXTERNAL_FIX="external-fix"
SETUP_CLONE="mirror"
SETUP_CLONE_FIX="mirror-fix"
SETUP_INTERNAL="normal"

monitor_mode=""

FILE="/tmp/monitor_mode.dat"

let -euxo pipefail
get_current_monitor_mode(){
	if [ ! -f $FILE ] ; then
		monitor_mode=$SETUP_INTERNAL
	else
		monitor_mode=$(cat "$FILE")
  fi
	echo "current monitor_mode is $monitor_mode"
}

get_monitors(){
  MONITORS=($(xrandr -q | grep " connected" | sed -e "s/ con[^\n]*/ /;s/\n//"))
  echo "Found ${#MONITORS[@]} monitors"
  for i in "${!MONITORS[@]}"; do
    echo "$i ${MONITORS[$i]}"
  done
}

set_new_monitor_mode(){
  echo "setting to $1"
  get_monitors
  echo "$1" > "$FILE"
  CMD="xrandr --output ${MONITORS[0]} --auto"
  if [ ${#MONITORS[@]} -gt 1 ]; then
    case $1 in
      "$SETUP_TRIANGLE")
        # | M1 | ... | MN |
        # | M0 |
        notify-send "Setting screens to $SETUP_TRIANGLE"
        for i in $(seq 1 $((${#MONITORS[@]}-1)) ); do
          CMD+=" --output ${MONITORS[$i]} --auto"
          if [ "$i" -eq 1 ]; then CMD+=" --above"; else CMD+=" --right-of"; fi
          CMD+=" ${MONITORS[$( ((i-1)) )]}"
        done
        ;;
      "$SETUP_TRIANGLE_REVERSED")
        # | MN | | MN-1 | ... | M1 |
        #                     | M0 |
        notify-send "Setting screens to $SETUP_TRIANGLE_REVERSED"
        for i in $(seq 1 $((${#MONITORS[@]}-1)) ); do
          CMD+=" --output ${MONITORS[$i]} --auto"
          if [ "$i" -eq 1 ]; then CMD+=" --above"; else CMD+=" --left-of"; fi
          CMD+=" ${MONITORS[$( ((i-1)) )]}"
        done
        ;;
      $SETUP_FULL)
        # | O2 |
        # | O1 |
        # | I1 |
        notify-send "Setting screens to $SETUP_FULL"
        for i in $(seq 1 $((${#MONITORS[@]}-1)) ); do
          CMD+=" --output ${MONITORS[$i]} --auto --above ${MONITORS[$( ((i-1)) )]}"
        done
        ;;
      $SETUP_FULL_REVERSED)
        # | O1 |
        # | O2 |
        # | I1 |
        notify-send "Setting screens to $SETUP_FULL_REVERSED (hardcoded for 2 monitors)"
        CMD+=" --output ${MONITORS[2]} --auto --above ${MONITORS[0]}"
        CMD+=" --output ${MONITORS[1]} --auto --above ${MONITORS[2]}"
        ;;
      $SETUP_CLONE)
        # | I1/O1/O2 |
        notify-send "Setting screens to $SETUP_CLONE"
        for i in $(seq 1 $((${#MONITORS[@]}-1)) ); do
          CMD+=" --output ${MONITORS[$i]} --auto --same-as ${MONITORS[0]}"
        done
        ;;
      $SETUP_EXTERNAL)
        # | O1 || O2 |
        notify-send "Setting screens to $SETUP_EXTERNAL"
        CMD="xrandr --output ${MONITORS[0]} --off"
        for i in $(seq 1 $((${#MONITORS[@]}-1)) ); do
          CMD+=" --output ${MONITORS[$i]} --auto"
        done
        ;;
      ####$SETUP_FULL_FIX)
        ####	xrandr --output ${MONITORS[0]} --auto
        ####	xrandr --output $OUTER2 --mode 1920x1080 --above ${MONITORS[0]}
        ####	xrandr --output $OUTER1 --mode 1920x1080 --above ${MONITORS[0]}	
        ####	;;
      ####$SETUP_CLONE_FIX)
        ####	xrandr --output ${MONITORS[0]} --auto 
        ####	xrandr --output $OUTER1 --mode 1920x1080 --same-as ${MONITORS[0]}
        ####	xrandr --output $OUTER2 --mode 1920x1080 --same-as ${MONITORS[0]}
        ####	;;
      ####$SETUP_EXTERNAL_FIX)
        ####	xrandr --output ${MONITORS[0]} --off
        ####	xrandr --output $OUTER1 --mode 1920x1080
        ####	xrandr --output $OUTER2 --mode 1920x1080 
        ####	;;
      *) 
        # {MONITORS[0]}AL / RESCUE
        echo "Unknown cmd $1, back to default monitor"
        for i in $(seq 1 ${#MONITORS[@]}); do
          CMD+=" --output ${MONITORS[$i]} --off"
        done
        rm "$FILE"
        ;;
    esac
  else
    echo "There is only 1 screen"
  fi
  notify-send "$CMD"
  $CMD
}

set_next_mode(){
  case $monitor_mode in
    $SETUP_INTERNAL)
      set_new_monitor_mode $SETUP_FULL
      ;;
    $SETUP_FULL)
      set_new_monitor_mode $SETUP_CLONE
      ;;
    $SETUP_CLONE)
      set_new_monitor_mode $SETUP_EXTERNAL
      ;;
    $SETUP_EXTERNAL)
      set_new_monitor_mode $SETUP_INTERNAL
      #set_new_monitor_mode $SETUP_FULL_FIX
      ;;
    ####$SETUP_FULL_FIX)
      ####	set_new_monitor_mode $SETUP_CLONE_FIX
      ####	;;
    ####$SETUP_CLONE_FIX)
      ####	set_new_monitor_mode $SETUP_EXTERNAL_FIX
      ####	;;
    ####$SETUP_EXTERNAL_FIX)
      ####	set_new_monitor_mode $SETUP_INTERNAL
      ####	;;
    *)
      #includes $SETUP_EXTERNAL_FIX
      set_new_monitor_mode $SETUP_INTERNAL
      ;;
  esac
}

set_previous_mode(){
  case $monitor_mode in
    $SETUP_INTERNAL) set_new_monitor_mode $SETUP_EXTERNAL;
      #set_new_monitor_mode $SETUP_EXTERNAL_FIX
      ;;
    $SETUP_FULL) set_new_monitor_mode $SETUP_INTERNAL; ;;
    $SETUP_CLONE) set_new_monitor_mode $SETUP_FULL; ;;
    $SETUP_EXTERNAL) set_new_monitor_mode $SETUP_CLONE; ;;
    ####$SETUP_FULL_FIX)
      ####	set_new_monitor_mode $SETUP_EXTERNAL
      ####	;;
    ####$SETUP_CLONE_FIX)
      ####	set_new_monitor_mode $SETUP_FULL_FIX
      ####	;;
    ####$SETUP_EXTERNAL_FIX)
      ####	set_new_monitor_mode $SETUP_CLONE_FIX
      ####	;;
    *) set_new_monitor_mode $SETUP_INTERNAL ;;
  esac
}

get_current_monitor_mode
case ${1} in
  $SETUP_FULL)              set_new_monitor_mode $SETUP_FULL; ;;
  $SETUP_FULL_REVERSED)     set_new_monitor_mode $SETUP_FULL_REVERSED; ;;
  $SETUP_TRIANGLE)          set_new_monitor_mode $SETUP_TRIANGLE; ;;
  $SETUP_TRIANGLE_REVERSED) set_new_monitor_mode $SETUP_TRIANGLE_REVERSED; ;;
  $SETUP_INTERNAL)          set_new_monitor_mode $SETUP_INTERNAL; ;;
  $SETUP_CLONE)             set_new_monitor_mode $SETUP_CLONE; ;;
  $SETUP_EXTERNAL)          set_new_monitor_mode $SETUP_EXTERNAL; ;;
  "previous") set_previous_mode; ;;
  "refresh") get_current_monitor_mode; set_new_monitor_mode "$monitor_mode" ;;
  "next") set_next_mode; ;; 
  *) set_next_mode; ;;
esac
set +eux
