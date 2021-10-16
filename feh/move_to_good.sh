#!/bin/bash
mkdir -p ./good
cp "$1" ./good 2>err && notify-send "$1 copied to ./good" || notify-send --urgency=critical "error with cp $1: $(cat err)"

 
