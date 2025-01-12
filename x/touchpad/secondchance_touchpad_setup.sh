#!/bin/bash

# get touchpad x device name
# enable click method
xinput set-prop "$(xinput list --name-only | grep ouchpad)" "libinput Click Method Enabled" 0 1
