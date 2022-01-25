#/bin/bash

# set -euxo pipefail

# TODO looping to get last x files
#   gld 5 
# TODO endless

get_latest_firefox_download(){
    DOWNLOADDIR="/tmp/mozilla_${USER}0"
    get_latest_file $DOWNLOADDIR
}

get_latest_download(){
    DOWNLOADDIR="$HOME/Downloads"
    get_latest_file $DOWNLOADDIR
}

get_latest_screenshot(){
    MYDIR="$HOME/pics/screenshots"
    get_latest_file $MYDIR
}

get_latest_file(){
    LATEST="$(ls -t $1 | head -n1)"
    if [ -z "$LATEST" ]; then
        echo "No file found at $1"
        exit 1
    else
        echo "Getting $LATEST"
        mv "$1/$LATEST" .
    fi
}

export -f get_latest_file
export -f get_latest_download
export -f get_latest_firefox_download
export -f get_latest_screenshot
