# General
alias ali="nvim ~/.bash_aliases; bash"
alias alii="nvim ~/.bash_individual_aliases; bash"

# long, all, human readable, extended
alias l="ls -lahF"
alias ll="ls -lahF"

if [ -f ~/.bash_individual_aliases ]; then
    . ~/.bash_individual_aliases
fi

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
