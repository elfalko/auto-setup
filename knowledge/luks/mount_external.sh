# to mount
lsblk # to find it
sudo cryptsetup luksOpen /dev/sdb4 extluks-sdb4
sudo mkdir -p /mnt/extluks-sdb4
sudo mount /dev/mapper/extluks-sdb4 /mnt/extluks-sdb4

# to unmount
sudo umount /mnt/*
sudo cryptsetup close extluks-sdb4


Reinstall grub: [arch thread](https://bbs.archlinux.org/viewtopic.php?id=279115)
relevant partitions:
* EFI
* /
* /home
