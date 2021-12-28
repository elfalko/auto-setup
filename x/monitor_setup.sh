#!/bin/bash

# These values are used in a monitor switching script for xrandr

###############################################################################
# FIX is currently disabled, see comments in previous and next
###############################################################################
set -eixo pipefail

# your ports
# xrandr -q
INTERN="eDP1"
OUTER1="DP1"
OUTER2="DP2"

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

get_current_monitor_mode(){
	# if we don't have a file, start at zero
	if [ ! -f $FILE ] ; then
		monitor_mode=$SETUP_INTERNAL
		# otherwise read the value from the file
	else
		monitor_mode=$(cat "$FILE")
    fi
	echo "current monitor_mode is $monitor_mode"
}

set_new_monitor_mode(){

echo "setting to $1"
echo "$1" > "$FILE"

case $1 in
	$SETUP_TRIANGLE)
        notify-send "Setting screens to $SETUP_TRIANGLE"
		xrandr --output $INTERN --auto \
            --output $OUTER2 --auto --above $INTERN \
            --output $OUTER1 --auto --right-of $OUTER2
		;;
	$SETUP_TRIANGLE_REVERSED)
        notify-send "Setting screens to $SETUP_TRIANGLE_REVERSED"
		xrandr --output $INTERN --auto \
            --output $OUTER2 --auto --above $INTERN \
            --output $OUTER1 --auto --left-of $OUTER2
		;;
	$SETUP_FULL)
        notify-send "Setting screens to $SETUP_FULL"
		xrandr --output $INTERN --auto \
            --output $OUTER1 --auto --above $INTERN \
            --output $OUTER2 --auto --above $OUTER1
		;;
	$SETUP_FULL_REVERSED)
        notify-send "Setting screens to $SETUP_FULL_REVERSED"
		xrandr --output $INTERN --auto \
            --output $OUTER2 --auto --above $INTERN \
            --output $OUTER1 --auto --above $OUTER2
		;;
	$SETUP_CLONE)
        notify-send "Setting screens to $SETUP_CLONE"
		xrandr --output $INTERN --auto \
            --output $OUTER1 --auto --same-as $INTERN \
            --output $OUTER2 --auto --same-as $INTERN
		;;
	$SETUP_EXTERNAL)
        notify-send "Setting screens to $SETUP_EXTERNAL"
		xrandr --output $INTERN --off \
            --output $OUTER1 --auto \
            --output $OUTER2 --auto
		;;
####$SETUP_FULL_FIX)
####	xrandr --output $INTERN --auto
####	xrandr --output $OUTER2 --mode 1920x1080 --above $INTERN
####	xrandr --output $OUTER1 --mode 1920x1080 --above $INTERN	
####	;;
####$SETUP_CLONE_FIX)
####	xrandr --output $INTERN --auto 
####	xrandr --output $OUTER1 --mode 1920x1080 --same-as $INTERN
####	xrandr --output $OUTER2 --mode 1920x1080 --same-as $INTERN
####	;;
####$SETUP_EXTERNAL_FIX)
####	xrandr --output $INTERN --off
####	xrandr --output $OUTER1 --mode 1920x1080
####	xrandr --output $OUTER2 --mode 1920x1080 
####	;;
	*) 
		# INTERNAL / RESCUE
		xrandr --output $INTERN --auto \
            --output $OUTER1 --off \
            --output $OUTER2 --off
        rm "$FILE"
		;;
esac
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
	$SETUP_INTERNAL)
		set_new_monitor_mode $SETUP_EXTERNAL
		#set_new_monitor_mode $SETUP_EXTERNAL_FIX
		;;
	$SETUP_FULL)
		set_new_monitor_mode $SETUP_INTERNAL
		;;
	$SETUP_CLONE)
		set_new_monitor_mode $SETUP_FULL
		;;
	$SETUP_EXTERNAL)
		set_new_monitor_mode $SETUP_CLONE
		;;
####$SETUP_FULL_FIX)
####	set_new_monitor_mode $SETUP_EXTERNAL
####	;;
####$SETUP_CLONE_FIX)
####	set_new_monitor_mode $SETUP_FULL_FIX
####	;;
####$SETUP_EXTERNAL_FIX)
####	set_new_monitor_mode $SETUP_CLONE_FIX
####	;;
	*)
		set_new_monitor_mode $SETUP_INTERNAL
		;;
esac
}

get_current_monitor_mode
case ${1} in
    $SETUP_FULL)
		set_new_monitor_mode $SETUP_FULL
        ;;
    $SETUP_FULL_REVERSED)
		set_new_monitor_mode $SETUP_FULL_REVERSED
        ;;
    $SETUP_TRIANGLE)
		set_new_monitor_mode $SETUP_TRIANGLE
        ;;
    $SETUP_TRIANGLE_REVERSED)
		set_new_monitor_mode $SETUP_TRIANGLE_REVERSED
        ;;
    $SETUP_INTERNAL)
		set_new_monitor_mode $SETUP_INTERNAL
        ;;
    $SETUP_CLONE)
		set_new_monitor_mode $SETUP_CLONE
        ;;
    $SETUP_EXTERNAL)
		set_new_monitor_mode $SETUP_EXTERNAL
        ;;
    "previous")
        set_previous_mode;
        ;;
    "refresh")
        get_current_monitor_mode;
        set_new_monitor_mode "$monitor_mode"
        ;;
    *)
        set_next_mode;
        ;;
esac
