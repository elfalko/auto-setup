
# long, all, human readable, extended
alias l="ls -lahF"
alias ll="ls -lahF"

export PS1="\[\033[1m\]\u:\W \[\033[0m\]"

# set -o vi


if [ -d /home/f/bin ]; then
    PATH+="$PATH:/home/f/bin"
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

    alias nvc="nvim ~/.config/nvim/init.vim"

else
    export EDITOR=vim
fi
export VISUAL=$EDITOR 

alias v="$EDITOR -O"
alias vi="$EDITOR -O"

# General
alias ali="$EDITOR ~/.bash_aliases; bash"
# each workplace will have their own stuff, so drop that in here
alias alii="$EDITOR ~/.bash_individual_aliases; bash"
if [ -f ~/.bash_individual_aliases ]; then
    . ~/.bash_individual_aliases
fi


# tmux
alias t="tmux -f ~/.config/tmux/tmux.conf"
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias ta="tmux -f ~/.config/tmux/tmux.conf attach"
alias tmc="nvim ~/.config/tmux/tmux.conf"

# git - works on top of git config
alias g='git'

alias gf='git fetch'
alias gi="git i"
alias gii="git ii"

alias ga="git add"
alias gd="git diff"
alias gitco='git commit -m '
alias gl='git l'
alias gco='git checkout'
alias gcd='git checkout develop; git fetch'
alias gcm='git checkout master; git fetch'
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

# man
export MANPAGER="$EDITOR +Man!"
# gO

alias m="make"

# Regolith
alias i3c="$EDITOR ~/.config/regolith/i3/config"

# regolith-auto
alias ras="cd ~/regolith-auto-setup/"
