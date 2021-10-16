#!/bin/bash
mkdir -p ./stitch
cp "$1" ./stitch 2>err && notify-send "$1 copied to ./stitch" || notify-send --urgency=critical "error with cp $1: $(cat err)"

 
