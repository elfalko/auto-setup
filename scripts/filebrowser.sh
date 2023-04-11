#!/bin/bash

# cycles through common gui browsers
# $1 folder path

nautilus $1 || thunar $1 || dolphin $1 || ranger $1 || notify-send 'No file browser found'
