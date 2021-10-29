#!/bin/bash
mkdir -p ./bad
mv "$1" ./bad 2>err && notify-send "$1 moved to ./bad" || notify-send --urgency=critical "error with mv $1: $(cat err)"

 
