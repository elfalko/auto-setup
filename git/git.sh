#!/bin/bash

# git - works on top of git config
alias g='git'
alias gic='$EDITOR ~/.gitconfig'

alias gbl='git branch --list'

alias gf='git fetch'
alias gi="git i"
alias gii="git ii"

alias ga="git add"
alias gd="git diff --minimal"
alias gdi="git diff --minimal --ignore-all-space"
alias gdw="git diff --minimal"
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

# gtfo(){
#     eval 'ssh-agent'
#     ssh-add ~/.ssh/id_ed25519
#     ssh -T git@bitbucket.com
#     ssh -T git@github.com
#     ssh -T git@gitlab.com
# }
