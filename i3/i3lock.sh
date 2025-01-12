#!/bin/bash
set -x

# wrapper for i3lock-color, which does not accept a config file apparently
TEXT="↑↑↓↓←→←→BA"
WRONG="GG EZ"
BG=$1
LOCK=i3lock

# if [ $# -lt 1 ]; then 
#     echo "$0 needs a path to an image"
#     exit 1
# fi

if [ -f /bin/i3lock-fancy ]; then
    echo "found i3lock-fancy"
    LOCK="i3lock-fancy"
elif [ -f /bin/i3lock-color ]; then
    echo "found i3lock-color"
    LOCK="i3lock-color"
    TEXTOPT="--greeter-text=$TEXT"
    WRONGOPT="--wrong-text=$WRONG"
    OPTS="-fill --show-failed-attempts --keylayout 0 --pass-media-keys --pass-volume-keys --pass-screen-keys --greeter-color=ffffffff -i $BG -e $TEXTOPT $WRONGOPT"
elif [ -f /usr/bin/betterlockscreen ]; then
    echo "found betterlockscreen"
    if [ $# -eq 1]; then
        notify-send "Generating new background"
        rm -rf $HOME/.cache/betterlockscreen/
        betterlockscreen --update $BG 
    fi
    LOCK="betterlockscreen"
    OPTS="--lock dim --off 10"
fi

$LOCK $OPTS 
