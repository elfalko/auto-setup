# General
alias ali="nvim ~/.bash_aliases; bash"
alias alii="nvim ~/.bash_individual_aliases; bash"

# long, all, human readable, extended
alias l="ls -lahF"
alias ll="ls -lahF"

export PS1="\[\033[1m\]\u:\W \[\033[0m\]"

# set -o vi

if [ -f ~/.bash_individual_aliases ]; then
    . ~/.bash_individual_aliases
fi

# sources all files in .falk/bash if they exist
# for file in ~/.bash/*; do
#   if [ -f "$file" ] ; then
#     . "$file"
#   fi
# done

# Regolith
alias i3c="nvim ~/.config/regolith/i3/config"

# nvim
export EDITOR=nvim
export VISUAL=$EDITOR 

alias nvc="nvim ~/.config/nvim/init.vim"

alias v="nvim -O"
alias vi="nvim -O"
alias vim="nvim -O"

# tmux
alias t="tmux -f ~/.config/tmux/tmux.conf"
alias ta="tmux -f ~/.config/tmux/tmux.conf attach"

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

# devices
alias wlsusb="watch -n 0.5 lsusb"


