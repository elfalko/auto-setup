cmd="rsync -rltDhP -zz --debug=FILTER"
# exclude non-relevant stuff
filter=--filter='-_*.pcap'
filter="$filter "--filter='-_node_modules'
filter="$filter "--filter='-_*Thumbs.db*'
filter="$filter "--filter='-_venv'

backupdir="/backups/f"
backupdest=""
servername=freenas

backup_folder(){
if [ -d $1 ]; then
    echo "$1 found, backup in progress"
    $cmd $filter $1 $2/ || return -1
else
    echo "$1 not found"
fi
}

backup_to_drive(){
    echo "$1"
    backup_path="$1"
    # mkdir -p "${backup_path}"
    # sudo mkdir -p ${backup_path}
    # sudo chown -R f:f ${backup_path}

    echo "backup in progress"
    # echo ".falk"
    # $cmd --exclude "thunderbird" /home/f/.falk "${backup_path}"/ || return -1
    backup_folder $HOME/auto-setup "${backup_path}"
    backup_folder $HOME/projects "${backup_path}"
    backup_folder $HOME/personal "${backup_path}"
    backup_folder $HOME/pics "${backup_path}"
    backup_folder $HOME/work "${backup_path}"
    backup_folder $HOME/music "${backup_path}"
    backup_folder $HOME/studies "${backup_path}"
    backup_folder $HOME/.local/share/mail "${backup_path}"

    # echo "VMs"
    # $cmd /home/f/VirtualBox VMs "${backup_path}"/ || return -1
    # echo "done with ${backup_path}"
}

declare -a StringArray=(
    '/run/media/f/My Book'
    '/run/media/f/falksbackup'
)


for loc in "${StringArray[@]}"; do
  if [ -d "$loc" ] ; then
    echo "$loc exists. Starting backup";
    backup_dest="${loc}${backupdir}";
    echo $backup_dest;

    backup_to_drive "$backup_dest"
  else
    echo "$loc not found.";
  fi
done

echo "running against server"
. $HOME/auto-setup/scripts/userrequest.sh
# if yn; then
backup_dest="$servername:~${backupdir}"
echo $backup_dest;
backup_to_drive "$backup_dest"
# else
#     echo "aborted, exiting"
#     break
# fi

