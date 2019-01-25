#!/bin/bash

service ssh stop



wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh

iptables -A INPUT -p tcp --tcp-flags RST RST -j DROP

#Create /etc/sysctl.d/local.conf 
#then sysctl --system


#apt-get install python-pip
pip install git+https://github.com/shadowsocks/shadowsocks.git@master

#setup /etc/ssh/sshd_config
#setup /etc/hosts.deny&allow
