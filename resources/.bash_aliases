# long, all, human readable, extended
alias l="ls -lahF"
alias ll="ls -lahF"

alias tf="tail -f"

alias agi="ag --ignore *.svg --ignore"

# ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ 

export PS1="\[\033[1m\]\u:\w \[\033[0m\]"

# set -o vi


if [ -d /home/$USER/bin ]; then
    PATH+="$PATH:/home/$USER/bin"
fi
if [ -d /home/$USER/.local/bin ]; then
    PATH+="$PATH:/home/$USER/.local/bin"
fi


# sources all files in .falk/bash if they exist
# for file in ~/.bash/*; do
#   if [ -f "$file" ] ; then
#     . "$file"
#   fi
# done

# nvim
if [ -f /bin/nvim ] ; then
    export EDITOR=nvim


    # man
    # export MANPAGER="$EDITOR +Man!"
else
    export EDITOR=vim
fi
export VISUAL=$EDITOR 
alias nvc="$EDITOR ~/.config/nvim/init.vim"

alias v="$EDITOR -O"
alias vi="$EDITOR -O"

# General
alias ali="$EDITOR ~/.bash_aliases; bash"
# each workplace will have their own stuff, so drop that in here
alias alii="$EDITOR ~/.bash_individual_aliases; bash"

if [ -f ~/.bash_individual_aliases ]; then
    . ~/.bash_individual_aliases
fi

if [ -f ~/auto-setup/scripts/get_latest_download.sh ]; then
    alias gld="/bin/bash ~/auto-setup/scripts/get_latest_download.sh"
fi

source $FAUTOSETUP/bash/tmux.sh
source $FAUTOSETUP/bash/git.sh

# history - ignore duplicates
export HISTCONTROL=ignoredups

# network
alias nethelp='echo "ip addr; route -n; sudo dhclient"'

# files
mkcd(){
    mkdir -p "$1" && cd -P "$1"
}
alias sshc="$EDITOR ~/.ssh/config"

# devices
alias wlsusb="watch -n 0.5 lsusb"

# gO

alias m="make"

# jupyter
# alias jnc="jupyter nbconvert --to script"

# regolith-auto
alias cdas="cd $FAUTOSETUP"

alias xx="xmodmap ~/.Xmodmap"

# python
alias p="python3"

source $FAUTOSETUP/bash/feh.sh

# WSL 2
# export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0
# https://sourceforge.net/projects/vcxsrv/files/latest/download
# "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl -dpi auto
# netstat -abno|findstr 6000 (admin Powershell)
# Windows Defender Firewall with Advanced Security > Inbound Rules > New Rule > Program > %ProgramFiles%\VcXsrv\vcxsrv.exe
# if that works
# win+r shell:startup
# copy shortcut in there
#
# https://medium.com/javarevisited/using-wsl-2-with-x-server-linux-on-windows-a372263533c3
# https://www.shogan.co.uk/how-tos/wsl2-gui-x-server-using-vcxsrv/

# wms
alias i3c="$EDITOR ~/.config/regolith/i3/config"
alias swc="$EDITOR ~/.config/sway/config"
alias sgo="swaymsg -t get_outputs"
alias sgi="swaymsg -t get_inputs"

# weather
alias wttr="curl v2.wttr.in/munich"

