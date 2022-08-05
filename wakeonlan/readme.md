# Wake on LAN

1. Enable in BIOS
2. temporary: `sudo ethtool --change enp4s0 wol g`
3. add service in /etc/systemd/system/wol.service to activate each start
4. enable

``` bash
sudo systemctl daemon-reload
sudo systemctl enable wol.service
systemctl status wol
```

5. test
wakeonlan -i <IP> <MAC>
sudo etherwake -D <MAC> -i <IF>

[source](https://necromuralist.github.io/posts/enabling-wake-on-lan/)
