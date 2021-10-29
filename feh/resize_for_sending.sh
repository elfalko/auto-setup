#!/bin/bash
newname="${1%.*}_small.${1##*.}"
oldname="$1"
convert "$oldname" -resize 20% "$newname" 2>err && notify-send "$oldname resized to 10% as $newname" || notify-send --urgency=critical "error with resizing $1: $(cat err)"

 
