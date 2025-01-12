#!/bin/bash

# follows https://github.com/AlfredoSequeida/hints?tab=readme-ov-file#installing
sudo pacman -Sy python-platformdirs python-packaging
sudo pacman -Sy && \
    sudo pacman -S git python cairo pkgconf gobject-introspection gtk4 libwnck3 python-pipx && \
    pipx ensurepath && \
    pipx install git+https://github.com/AlfredoSequeida/hints.git
