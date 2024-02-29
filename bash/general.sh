#!/bin/bash
# general aliases for common linux tools
# no $EDITOR included yet as that gets set later

# long, all, human readable, extended
alias l="ls -lahF"
alias ll="ls -lahF"
alias lc="ls -clthF | head"

alias c="clear"

cx(){
    touch $1
    chmod +x $1
}

alias tf="tail -f"

# silver surfer 
if [ -f /bin/ag ]; then
    alias agi="ag --ignore \w*\.(hex|svg|o)"
fi

# files
mkcd(){
    mkdir -p "$1" && cd -P "$1"
}

# network
alias nethelp='echo "ip addr; route -n; sudo dhclient"'

# ultra shorthand
m(){
    make $1 && notify-send "Make completed" || notify-send "Make FAILED (╯°□°)╯︵┻━┻ && return -1"
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# w(){
#     watch -n 0.5 "$1"
# }

# power
alias sn="sudo shutdown now"

alias alg="alias | grep -i"
