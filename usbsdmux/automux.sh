#!/bin/bash

if command -v usbsdmux 2>&1 > /dev/null; then
function automux(){
	DIR="/dev/usb-sd-mux/"

	# get latest mux
	unset -v latest
	for muxer in "$DIR"/id*; do
	  [[ $muxer -nt $latest ]] && latest=$muxer
	done

#	echo "Using $latest" 

	usbsdmux "$latest" $@
}

alias sdh="automux host"
alias sdd="automux dut"

export -f automux
fi
