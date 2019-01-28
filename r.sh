#!/bin/bash

service ssh stop

#enable bbr
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh

#drop tcp-rst
iptables -A INPUT -p tcp --tcp-flags RST RST -j DROP

#optimizing networking 
cp local.conf /etc/sysctl.d/local.conf 
sysctl --system

#install ss 
apt-get install python-pip
pip install git+https://github.com/shadowsocks/shadowsocks.git@master

#block ssh &etc
#setup /etc/ssh/sshd_config
#setup /etc/hosts.deny&allow

#shut ipv6
sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6'
