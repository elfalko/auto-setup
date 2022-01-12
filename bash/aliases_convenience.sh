#!/bin/bash

alias cdas="cd $FAUTOSETUP"


# herpderp
alias cd..="cd .."
alias cd...="cd ../.."
alias rmrf="rm -rf"


# fancy dmesg
alias fdmesg="dmesg --human --reltime --color --follow --decode"

# fancy cat
function fcat () {
    [ -f /usr/bin/batcat ] && batcat "$@" || cat "$@"
}

alias cdd="cd ~/Downloads"
# fast movement of download files
if [ -f ~/auto-setup/scripts/get_latest_download.sh ]; then
    source ~/auto-setup/scripts/get_latest_download.sh
    alias gld="get_latest_download"
    alias glfd="get_latest_firefox_download"
fi

# python
alias p="python3"

# ssh
alias sshc="$EDITOR ~/.ssh/config"


#todo 
# if [ -f /usr/bin/td ]; then
#     alias tdi="td -i"
# fi

# devices
alias wlsusb="watch -cd -n 0.5 lsusb"

# weather
alias wttr="curl v2.wttr.in/munich"
