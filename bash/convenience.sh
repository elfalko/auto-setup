#!/bin/bash

alias cdas="cd $FAUTOSETUP"

# if just a path is used, cd there
shopt -s autocd

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
    alias glf="get_latest_file"
    alias gld="get_latest_download"
    alias glfd="get_latest_firefox_download"
    alias glss="get_latest_screenshot"
fi

alias ffs="/bin/bash $FAUTOSETUP/scripts/foldersizes.sh"

# python
alias p="python3"

# ssh
alias sshc="$EDITOR ~/.ssh/config"
# enable compression
alias scp="scp -C"
# archive mode, verbose, compression, prune empty dirs
alias rs="rsync -avzm --progress"


# devices
alias wlsusb="watch -cd -n 0.5 lsusb"

# weather
alias wttr="curl v2.wttr.in/munich"

alias rffree="rfkill list; rfkill unblock all; rfkill list"
