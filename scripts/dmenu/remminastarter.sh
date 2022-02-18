#!/bin/bash

set -exo pipefail

# print_help(){
#     echo "Test script"
#     echo
#     echo "Usage"
#     echo "  $0 ARG1 [ARG2]"
# }

# if [ ! $# -le 1 ]; then
#     print_help
#     exit 1
# fi

DMENUSELECT=$HOME/auto-setup/scripts/dmenu/dmenufileselection.sh
REMMINACONFIGS=$HOME/.local/share/remmina/

remmina --connect="$(/bin/bash $DMENUSELECT $REMMINACONFIGS)"
