distro="$(lsb_release -d || grep -i NAME /etc/os-release)"
echo "$distro" | grep -i ubuntu > /dev/null && source $HOME/auto-setup/bash/ubuntu.sh
echo "$distro" | grep -i manjaro > /dev/null && source $HOME/auto-setup/bash/manjaro.sh
echo "$distro" | grep -i arch > /dev/null && source $HOME/auto-setup/bash/arch.sh
