#!/bin/bash

#$1 IP
#$2 iptables number
#$3 port number


iptables -R INPUT $2 -s $1 -p tcp --dport $3 -j ACCEPT
