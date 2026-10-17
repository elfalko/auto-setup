if command -v sway >/dev/null 2>&1; then
  alias fsway="exec sway -c $FAUTOSETUP/sway/config"

  alias swc="$EDITOR $FAUTOSETUP/sway/config"
  alias sgo="swaymsg -t get_outputs | jq '.[] | .name,.rect'"
  alias sgi="swaymsg -t get_inputs"
  alias sgt="swaymsg -t get_tree"
  alias sgtg="swaymsg -t get_tree | grep -i"

  # fix for VMSVGA without cursor
  # export WLR_NO_HARDWARE_CURSORS=1
fi
