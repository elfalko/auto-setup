# Custom Keyboard
what do I want:
- German characters äöüßäÄÖÜ
- German kb accents: accents both ways, circumflex, degree sign
- directional keys on another layer

## Keyboard decisions
US base layout
or better
German (US) (already contains Umlauts)

__altgr umlaut:__
altgr instead of alt since alt is used elsewhere

altgr+a/o/u -> ä/ö/ü
altgr+A/O/U -> Ä/Ö/Ü
altgr+s -> ß
altgr+S -> ẞ

__no caps (modifier for i3)__

## Keyboards in Arch
[archwiki](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)

basic console config in /etc/vconsole.conf
just set keymap with `KEYMAP=de_base_us`
mine in subfolder i386/qwerty/de_base_us
normal keymaps in /usr/share/kbd/keymaps

For the arch system in general
[console config](https://wiki.archlinux.org/index.php/Keyboard_configuration_in_console)

General: there is a terminal setup and an x setup. 
x needs to be the fancier one. Who needs umlauts in tty terminal?

## Keymap for X
[xorg keyboard config](https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg)

[xkb enhancement tutorial pdf](https://www.x.org/releases/X11R7.6/doc/xorg-docs/input/XKB-Enhancing.pdf)
old: [xkb tutorial](http://pascal.tsu.ru/en/xkb/)

[X kbd extension modifiers](https://wiki.archlinux.org/index.php/X_keyboard_extension#Real_modifiers)

keyboard layouts in `/usr/share/X11/xkb/symbols/`

de layout contains variant us suitable

test with 
``` bash
setxkbmap -v -variant us -layout us
```

added modifier to it in `custom` file

make persistent with 
``` bash
sudo localectl --no-convert set-x11-keymap custom pc105 basic terminate:ctrl_alt_bksp,caps:none
```

## Options collection

function keys

arch
lighter/darker = up/down

up 
^[[A0xe0 0x48 
0xe0 0xc8 

down
^[[B0xe0 0x50 
0xe0 0xd0 

with fn
up
0xe0 0x54 0xe0 0xd4 

down
0xe0 0x4c 0xe0 0xcc 

compose key is a nice thing
setxkbmap -o compose:lwin
    key still works in windows as it should :D

disable all setxkbmap options
    setxkbmap -options

query current
    setxkbmap -query

## add to e.g. GNOME
[reddit post](https://www.reddit.com/r/gnome/comments/b5o6tx/comment/ejepzkl/?utm_source=share&utm_medium=web2x&context=3)
edit /usr/share/X11/xkb/rules/base.xml
find <layoutlist>
copy variant

[custom keyboard layouts haiti style](https://help.ubuntu.com/community/Custom%20keyboard%20layout%20definitions)

## Building a custom keymap 
__Only necessary if the tty keymap needs changing__
documentation in
`man keymaps`
important: column 4 allows shift+altgr modifiers

Copy us keyboard from /usr/share/xkb/i386/qwerty/us.map.gz
look at /usr/share/xkb/i386/qwertz/de-latin1.map.gz

find special keys
o/a/udiaeresis
ssharp

map them to correct keys (found in includes of keymap)

test with
	loadkeys -C /dev/ttyXX <layout>
	
to find ttyXX
	who

put layout in /usr/share/kbd/keymaps/i386/qwerty/de_base_us

to make persistent
	localectl set-keymap --noconvert de_base_us
or in /etc/vconsole
	KEYMAP=de_base_us

http://kbd-project.org/docs/howto-linux-keyboard-and-console/kbd-5.html

