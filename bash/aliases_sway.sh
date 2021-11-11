#!/bin/bash

if [ -f /bin/sway ]; then
alias swc="$EDITOR ~/.config/sway/config"
alias sgo="swaymsg -t get_outputs | jq '.[] | .name,.rect'"
alias sgi="swaymsg -t get_inputs"
alias sgt="swaymsg -t get_tree"
alias sgtg="swaymsg -t get_tree | grep -i"
fi
