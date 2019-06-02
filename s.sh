#!/bin/bash

#service ssh stop

#drop tcp-rst
iptables -A INPUT -p tcp --tcp-flags RST RST -j DROP

#block ssh &etc
#setup /etc/ssh/sshd_config
#setup /etc/hosts.deny&allow
#/etc/ssh/sshd_config 
#echo 'AllowUsers root@www.xxx.com' > /etc/ssh/sshd_config 

#shut ipv6
sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6'

#ban crack ip
#wget https://raw.githubusercontent.com/shadowsocks/shadowsocks/master/utils/autoban.py
python autoban.py < /var/log/shadowsocks.log
nohup tail -F /var/log/shadowsocks.log | python autoban.py >log 2>log &
