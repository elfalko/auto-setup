#!/bin/bash

# cycles through common gui browsers
# $1 folder path

dolphin $1 || thunar $1 || ranger $1 || notify-send 'No file browser found'
