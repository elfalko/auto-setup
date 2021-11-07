#!/bin/bash

# this file concatenates all files given in separate row in includes
# and writes the file to the given output file

# fileformat of include file
# each file in a new line
# '#' marks comment lines

IN=$1
OUT=$2

cat -v $(cat $IN | grep -v "#") > "$OUT"
