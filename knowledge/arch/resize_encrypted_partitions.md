# Resizing encrypted partitions

## Resizing partitions

It's easy, but complicated.

[SO answer](https://askubuntu.com/a/762184)

Do all this on a live system

Copy whole drive, e.g. for backup

``` bash
sudo dd status=progress bs=200M if=/dev/sd<old> of=/dev/sd<backup>
```

On the drive which shall be used, use gparted to move partition

then use fdisk for resizing

``` bash 
fdisk
m           # shows commands
p           # print partition table
d <n> n     # delete partition in question (yes, with luks on it), but don't delete luks signature
n           # create new partition in its place
t L <n>     # adjust partition type as necessary
w           # write new partition type
```

With the correctly sized partition, let's figure out LUKS

``` bash
sudo cryptsetup luksOpen /dev/sd<new> sd<new>_crypt
sudo cryptsetup resize sd<new>_crypt

sudo e2fsk  # will be autorecommended by next command
# press a
sudo resize2fs /dev/sd<new>_crypt
```


## Fixing crypttab

[arch wiki page on crypttab (search "Mounting at boot time")](https://wiki.archlinux.org/title/Dm-crypt/System_configuration)

adjust `/etc/crypttab` and `/etc/fstab` as necessary

