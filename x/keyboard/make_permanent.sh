#!/bin/bash

# permanently sets the current keymap
MYKBD="custom"

sudo localectl --no-convert set-x11-keymap $MYKBD pc105 basic terminate:ctrl_alt_bksp,caps:none
