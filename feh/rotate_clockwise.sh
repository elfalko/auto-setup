#!/bin/bash
convert -rotate 90 "$1" "$1" 2>err && notify-send "$1 rotated 90°" || notify-send --urgency=critical "error with rotating $1: $(cat err)"
