sudo sed -i -e "s/# deny .*$/deny = 10/; s/# fail_interval = .*$/fail_interval = 60/; s/# unlock_time = .*$/unlock_time = 30/;" /etc/security/faillock.conf
sudo faillock --user $USER --reset
