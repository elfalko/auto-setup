
# long, all, human readable, extended
alias l="ls -lahF"
alias ll="ls -lahF"


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

# tmux
alias t="tmux -f ~/.config/tmux/tmux.conf"
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias ta="tmux -f ~/.config/tmux/tmux.conf attach"
alias tmc="$EDITOR ~/.config/tmux/tmux.conf"

# git - works on top of git config
alias g='git'
alias gic='$EDITOR ~/.gitconfig'

alias gbl='git branch --list'

alias gf='git fetch'
alias gi="git i"
alias gii="git ii"

alias ga="git add"
alias gd="git diff --minimal"
alias gdc="git diff --compact-summary"
alias gdf="git diff --name-only"
alias gitco='git commit -m '
alias gl='git l'
alias gco='git checkout'
alias gcd='git checkout develop; git fetch'
alias gcm='git checkout master; git fetch'
alias gcom='git checkout master'
alias gc='git commit'
alias gfp='git pull'
alias gp='git push'
alias gpu='git push -u origin '

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

# weather
alias wttr="curl v2.wttr.in/munich"

# wms
alias i3c="$EDITOR ~/.config/regolith/i3/config"
alias swc="$EDITOR ~/.config/sway/config"


# regolith-auto
alias cdas="cd ~/auto-setup/"

alias xx="xmodmap ~/.Xmodmap"

#python
alias p="python3"
