#!/bin/bash
# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01). Check `man date` on how to format
# time and date.
date_formatted=$(date "+%a %F %H:%M")

# "upower --enumerate | grep 'BAT'" gets the battery name (e.g.,
# "/org/freedesktop/UPower/devices/battery_BAT0") from all power devices.
# "upower --show-info" prints battery information from which we get
# the state (such as "charging" or "fully-charged") and the battery's
# charge percentage. With awk, we cut away the column containing
# identifiers. i3 and sway convert the newline between battery state and
# the charge percentage automatically to a space, producing a result like
# "charging 59%" or "fully-charged 100%".
battery_info=$(upower --show-info $(upower --enumerate | grep 'BAT'))
battery_state=$(grep "state" <<< "$battery_info" |\
awk '{print $2=="discharging" ? "🔋" : "⚡"}')
battery_level=$(grep "percentage" <<< "$battery_info" | awk '{print $2}')

# "amixer -M" gets the mapped volume for evaluating the percentage which
# is more natural to the human ear according to "man amixer".
# Column number 4 contains the current volume percentage in brackets, e.g.,
# "[36%]". Column number 6 is "[off]" or "[on]" depending on whether sound
# is muted or not.
# "tr -d []" removes brackets around the volume.
# Adapted from https://bbs.archlinux.org/viewtopic.php?id=89648
audio_volume=$(amixer -c 1 get Master | awk '/Mono.+/ {print $6=="[off]" ? "🔇 ": "🔊 "$4}' | tr -d [])
mic_volume=$(amixer -c 1 get Mic | awk '/Front.Left:.+/ {print $7=="[off]" ? "🎤MUTE ": "🎤 "$5}' | tr -d [])

# get with
# swaymsg -t get_inputs | grep "identifier"
kbdid="1:1:AT_Translated_Set_2_keyboard"
kbdlayout=$(swaymsg -t get_inputs | jq -r '.[] |
    select(.identifier == "1:1:AT_Translated_Set_2_keyboard") | .xkb_active_layout_name')
# Additional emojis and characters for the status bar:
# Electricity: ⚡ ↯ ⭍ 🔌
# Audio: 🔈 🔉 🎧 🎶 🎵 🎤
# Separators: \| ❘ ❙ ❚
# Misc: 🐧 💎 💻 💡 ⭐ 📁 ↑ ↓ ✉ ✅ ❎
echo $kbdlayout $mic_volume $audio_volume $battery_state$battery_level $date_formatted
