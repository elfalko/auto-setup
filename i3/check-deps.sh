#!/bin/bash
#
# script to check if programs are missing
# TODO cycle through $@ and install all

distro="$(lsb_release -d)"
pkgmanager="#package manager"
echo "$distro" | grep -i ubuntu && pkgmanager="sudo apt install"
echo "$distro" | grep -i manjaro && pkgmanager="pamac install"
echo "$distro" | grep -i arch && pkgmanager="sudo pacman -Sy"

function find_or_install(){
    which "$1" || ${pkgmanager} $1
}

find_or_install jq
find_or_install polkit
find_or_install i3blocks
find_or_install i3lock-color
find_or_install autotiling
