#!/bin/bash

service ssh stop

apt-get install python-pip
pip install git+https://github.com/shadowsocks/shadowsocks.git@master

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh

iptables -A INPUT -p tcp --tcp-flags RST RST -j DROP
