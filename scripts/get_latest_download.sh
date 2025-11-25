#!/bin/bash

#set -exo pipefail

# TODO looping to get last x files
#   gld 5 
# TODO endless

get_latest_firefox_download(){
    DOWNLOADDIR="/tmp/mozilla_${USER}0"
    get_latest_file "$DOWNLOADDIR"
}

get_latest_download(){
    DOWNLOADDIR="$HOME/Downloads"
    get_latest_file "$DOWNLOADDIR"
}

get_latest_screenshot(){
    MYDIR="$HOME/pics/screenshots"
    get_latest_file "$MYDIR"
}

find_latest_file(){
    unset -v latest

    SEARCHPATH="$1"
    if [ -d "$1" ]; then
	#echo "$1 is directory, getting latest file inside"
    	SEARCHPATH="$1/*"
    fi
    #echo "$SEARCHPATH"

    for file in $SEARCHPATH; do
        [[ $file -nt $latest ]] && latest=$file
    done

    if [ -z "$latest" ]; then
        echo "No file found at $SEARCHPATH"
        exit 1
    else
        echo "$latest"
    fi
}
    

get_latest_file(){
    mv "$(find_latest_file ${1})" .
}

export -f find_latest_file
export -f get_latest_file
export -f get_latest_download
export -f get_latest_firefox_download
export -f get_latest_screenshot
