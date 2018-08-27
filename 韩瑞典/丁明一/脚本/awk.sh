#!/bin/bash
user=`awk -F: '/bash$/{print $1}' /etc/passwd`
for i in $user
do
	#grep $i /etc/shadow | awk -F: '{print $1,$2}'
	#awk -F: '/'$i'/{print $1,$2}' /etc/shadow
	awk -F: -v x=$i '$1==x{print $1,$2}' /etc/shadow
done
