#!/bin/bash

if command -b xinit >/dev/null 2>&1; then
  alias xkbf="/bin/bash $FAUTOSETUP/x/keyboard/set_as_default.sh"
  # alias xx="xmodmap ~/.Xmodmap"


  alias i3vnc="sudo systemctl start vncserver@3.service"

  alias xq="xrandr -q"

  #/usr/bin/setxkbmap -option "caps:swapescape" -option "terminate:ctrl_alt_bksp"

  alias blmax=". ~/auto-setup/x/simple_backlight_ctl.sh max"
  alias blctl=". ~/auto-setup/x/simple_backlight_ctl.sh"
fi
