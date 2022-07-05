#!/bin/bash

# returns the number of connected montitors

# space before connected removes any `disconnected` results
xrandr -q | grep " connected" | wc -l
