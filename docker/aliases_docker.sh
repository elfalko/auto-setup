#!/bin/bash

alias dps="docker ps"
alias drm="docker rm -f"
alias de="docker exec"
# gets ID of last docker container
dl(){
    # docker ps -lq
    docker ps --last=-1 --quiet
}
# rms the last docker container
dkl(){
    docker rm -f $(dl)
}
# execs the last docker container 
del(){
    docker exec $(dl)
}
