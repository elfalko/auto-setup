#!/bin/bash

echo "Adding user $(whoami) to vboxsf for shared folder access:"
# add user to group able to access shared folders
if groups $(whoami) | grep -q "\bvboxsf\b"; then
    echo "  $(whoami) is already in vboxsf"
else
    sudo usermod -aG vboxsf $(whoami) 
fi
echo ""

echo "You might want to restart to allow the full config to take effect"
