
backup_to_drive(){
    echo "$1"
backup_path="$1"
# mkdir -p "${backup_path}"
cmd="rsync -rltDhP -zz --exclude={'.Thumb.db*','Thumb.db*','node_modules','.cache','venv/*'}"
# sudo mkdir -p ${backup_path}
# sudo chown -R f:f ${backup_path}

echo "backup in progress"
# echo ".falk"
# $cmd --exclude "thunderbird" /home/f/.falk "${backup_path}"/ || return -1
echo "pics"
rm -f $HOME/pics/**/Thumbs.db*
rm -f $HOME/pics/**/.Thumbs.db*
$cmd $HOME/pics "${backup_path}"/ || return -1
echo "personal"
$cmd $HOME/personal "${backup_path}"/ || return -1
echo "projects"
$cmd $HOME/projects "${backup_path}"/ || return -1
echo "work"
$cmd $HOME/work "${backup_path}"/ || return -1
echo "music"
$cmd $HOME/music "${backup_path}"/ || return -1
echo "books"
$cmd $HOME/books "${backup_path}"/ || return -1
echo "studies"
# rm -f $HOME/studies/**/Thumbs.db*
# rm -f $HOME/studies/**/.Thumbs.db*
# $cmd $HOME/studies "${backup_path}"/ || return -1
echo "mail"
$cmd $HOME/.local/share/mail "${backup_path}"/ || return -1
echo "VMs"
# $cmd /home/f/VirtualBox VMs "${backup_path}"/ || return -1
# echo "done with ${backup_path}"
}

declare -a StringArray=(
    '/run/media/f/My Book'
    '/run/media/f/falksbackup'
)

backupdir="/backups/f"
backupdest=""

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

echo "run against server?"
. $HOME/auto-setup/scripts/userrequest.sh
if yn; then
    backup_dest="freenas:~${backupdir}"
    echo $backup_dest;
    backup_to_drive "$backup_dest"
else
    echo "aborted, exiting"
    break
fi

