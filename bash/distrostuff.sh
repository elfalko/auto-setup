distro="$(lsb_release -d)"
echo "$distro" | grep -i ubuntu > /dev/null && source $HOME/auto-setup/bash/ubuntu_aliases.sh
echo "$distro" | grep -i manjaro > /dev/null && source $HOME/auto-setup/bash/manjaro_aliases.sh
echo "$distro" | grep -i arch > /dev/null && source $HOME/auto-setup/bash/arch_aliases.sh
