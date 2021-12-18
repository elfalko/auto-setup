#!/bin/bash

alias cdas="cd $FAUTOSETUP"

alias cdd="cd ~/Downloads"

# herpderp cd
alias cd..="cd .."
alias cd...="cd ../.."


# fancy dmesg
alias fdmesg="dmesg --human --reltime --color --follow --decode"

# fancy cat
function fcat () {
    [ -f /usr/bin/batcat ] && batcat "$@" || cat "$@"
}

# fast movement of download files
if [ -f ~/auto-setup/scripts/get_latest_download.sh ]; then
    alias gld="/bin/bash ~/auto-setup/scripts/get_latest_download.sh"
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
