# convert deb packages to arch packages 
[howto](https://www.ostechnix.com/convert-deb-packages-arch-linux-packages/)
install debtap
``` bash
trizen -Syu debtap
```

initialize debtap
``` bash
sudo debtap -u
```

convert package `-q` to skip most questions
``` bash
debtap package.deb
```

install package with pacman
``` bash 
sudo pacman -U package.pkg.tar.zst
```

