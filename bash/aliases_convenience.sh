#!/bin/bash

alias cdas="cd $FAUTOSETUP"

alias cdd="cd ~/Downloads"

alias cd..="cd .."
alias cd...="cd ../.."

alias fdmesg="dmesg --human --reltime --color --follow --decode"

function fcat () {
    [ -f /usr/bin/batcat ] && batcat "$@" || cat "$@"
}
