#!/bin/bash
#
# script to check if programs are missing
# TODO cycle through $@ and install all

function find_or_install(){
    which "$1" || ${PKG_MANAGER} $1
}

find_or_install jq
find_or_install polkit
find_or_install i3-wm
find_or_install i3blocks
find_or_install i3lock-color
find_or_install autotiling
find_or_install dunst
find_or_install dmenu
