#/bin/bash

# set -euxo pipefail

get_latest_firefox_download(){
    DOWNLOADDIR="/tmp/mozilla_${USER}0"
    get_latest_file $DOWNLOADDIR
}

get_latest_download(){
    DOWNLOADDIR="$HOME/Downloads"
    get_latest_file $DOWNLOADDIR
}

get_latest_file(){
    LATEST="$(ls -t $1 | head -n1)"
    if [ -z "$LATEST" ]; then
        echo "No file found at $1"
        exit 1
    else
        echo "Getting $LATEST"
        mv "$DOWNLOADDIR/$LATEST" .
    fi
    exit 0
}

export -f get_latest_file
export -f get_latest_download
export -f get_latest_firefox_download
