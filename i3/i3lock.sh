#!/bin/bash

# wrapper for i3lock-color, which does not accept a config file apparently
TEXT="↑↑↓↓←→←→BA"
WRONG="GG EZ"
BG="~/pics/wallpapers/bounty_hunters_by_wojtekfus-dar6xah.png"
LOCK=i3lock

if [ -f /bin/i3lock-fancy ]; then
  LOCK="i3lock-fancy"
elif [ -f /bin/i3lock-color ]; then
  LOCK="i3lock-color"
  TEXTOPT="--greeter-text=$TEXT"
  WRONGOPT="--wrong-text=$WRONG"
  OPTS="-F -f --keylayout 0 --pass-media-keys --pass-volume-keys --pass-screen-keys --greeter-color=ffffffff -i $BG -e $TEXTOPT $WRONGOPT"
fi

$LOCK $OPTS 
