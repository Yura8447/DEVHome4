#! /bin/bash


useradd adminuser

echo 'adminuser:secret' | sudo chpasswd
groupadd admin

echo '%admin ALL=(ALL:ALL) ALL' >> /etc/sudoers
usermod -a -G admin adminuser


useradd poweruser
echo 'poweruser ALL=(ALL:ALL) /usr/sbin/iptables' >> /etc/sudoers

usermod -a -G adminuser poweruser
find / -type d -perm 4000 -exec ls -ld {} \; 1>> /var/suid_files.txt 2> /dev/null
