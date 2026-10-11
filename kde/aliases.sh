#!/bin/bash

if command -v startplasma-wayland >/dev/null 2>&1; then
  alias fkde="/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland"
fi
