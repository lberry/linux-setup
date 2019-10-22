#!/bin/bash
loc="[\"中国\",\"某省\",\"某市\",\"\",\"电信\"]"
lport=端口号

echo "-------------------------------------" 
date -d +"+8 hours"
echo "Get a tcp dump................."
temp=`/usr/sbin/tcpdump tcp port $lport -c 1 2>/dev/null |grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"`

date -d +"+8 hours" +%T
echo "Tcp dump get success!"
if test -z $temp 
then 
	echo "Got no ip! Exit!"
	exit 0
fi

echo "Got a NEW IP: $temp"

laip=`cat /root/linux-setup/lastip`
echo "last ip is : $laip"
#temp=$laip
if [ $temp = $laip ] ; then
	echo "IP already exist, exit!"
	exit 0
fi

bip=`cat /root/linux-setup/badip | grep -E -o "$temp"`
if test -n $bip ; then
	echo "Bad ip already exist!"
	exit 0
fi

echo " IP exist,and not equal last IP! Continue."
getloc=`wget -O - -q freeapi.ipip.net/$temp`
echo "freeapi.ipip.net find: $temp is :$getloc"
echo $loc

if [ $getloc = $loc ]; then
	iptables -R INPUT 2 -s $temp -p tcp --dport $lport -j ACCEPT
	echo $temp > /root/linux-setup/lastip
	echo "Change iptables complete!"
	iptables -L
else
	echo "New ip is bad ip ,save and exit!"
	date -d +"+8 hours" >>/root/linux-setup/badip
	echo $temp >>/root/linux-setup/badip
	echo $getloc >>/root/linux-setup/badip
fi

