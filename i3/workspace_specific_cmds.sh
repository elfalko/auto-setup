#!/bin/bash

# TODO
# * read external config
# * also add sway command to get workspace

# this script does:
# 1. read the current ws name/number from i3
# 2.1 execute a command based on it or
# 2.2 open a mode based on it

set -e

launch_ws_specific_programs(){
    # get workspaces | find focused | get name field
    curws=$(i3-msg -t get_workspaces | grep -o '{[^{]*"focused":true[^}]*}' | grep -o 'name[^,]*,')
    # split off the rest of the field address
    curws=${curws##*:\"}
    curws=${curws%\",}

    # get set binding modes so we can call them
    modes=$(i3-msg -t get_binding_modes )
    # split off ends
    modes=${modes#[}
    modes=${modes%]}

    # read into array for referencing
    IFS=',' read -r -a modesarray <<< "$modes"

    # call from cmdline to see your current modes
    # for m in "${modesarray[@]}"; do
    #     echo "$m"
    # done

    case "$curws" in
        Tunes)
            # echo "Tunes"
            exec ~/auto-setup/scripts/chat.sh 
            ;;
        P3D)
            # echo "3DP"
            i3-msg mode "${modesarray[1]}"
            ;;
        Why)
            # echo "Windoofs"
            exec vboxmanage startvm "WIN10" 
            ;;
        Mail)
            # echo "Mail"
            exec thunderbird
            ;;
        *)
            # fail so we can launch normal launcher
            return -1
    esac
}

launch_ws_specific_programs
