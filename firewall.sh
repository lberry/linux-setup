#!/bin/bash


temp=`tcpdump -c 10 `|grep -E -o "([0-9]{1,3}[\.]){4}[0-9]{1,5}"|grep -E -o "([0-9]{1,3}[\.]){3}"
count=echo $temp | grep -E -c "([0-9]{1,3}[\.]){3}"

IP=echo $temp | head -n 1

