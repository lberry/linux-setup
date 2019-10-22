#!/bin/bash


touch a.log
touch lastip
touch badip

while :
do 
     ./firewall.sh >> a.log
done
