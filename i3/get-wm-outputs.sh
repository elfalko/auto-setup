
# TODO for future x-free stuff
i3-msg -t get_outputs | jq '.[].name' | grep -v "xroot"
