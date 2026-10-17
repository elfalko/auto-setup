pkgmgr_opts="-Sy --needed"
if command -v trizen >/dev/null 2>&1; then
  export PKG_MANAGER="trizen ${pkgmgr_opts}"
else
  export PKG_MANAGER="pacman ${pkgmgr_opts}"
fi

alias tri="/bin/bash $FAUTOSETUP/arch/trizen_safer.sh"
alias disup="/bin/bash $FAUTOSETUP/arch/discord_update.sh"
