#!/bin/bash

# source $FAUTOSETUP/bash/nvim_c_stuff.sh
# nvim
if [ -f /bin/nvim ] ; then
    export EDITOR=nvim

    # man
    # export MANPAGER="$EDITOR +Man!"
elif [ -f /bin/vim ] ; then
    export EDITOR=vim
else
    # assume vi always exists
    export EDITOR=vi
fi

export VISUAL=$EDITOR 

alias v="$EDITOR -O"
alias vi="$EDITOR -O"
alias nvc="$EDITOR ~/.config/nvim/init.vim"

vc(){
    $EDITOR -O $1h $1c
}

# set -o vi
