#!/bin/bash

# wrapper for i3lock-color, which does not accept a config file apparently
TEXT="↑↑↓↓←→←→BA"
BG="~/pics/wallpapers/bounty_hunters_by_wojtekfus-dar6xah.png"

i3lock --greeter-text="$TEXT" --wrong-text="FAIL" -i $BG -F --keylayout 0 -f --pass-media-keys --pass-screen-keys --pass-volume-keys -e --greeter-color=ffffffff
