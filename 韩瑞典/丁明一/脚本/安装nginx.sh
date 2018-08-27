#!/bin/bash
a=`yum repolist | awk '/repolist/{print $2}' | sed -n 's/,//'`
if [ $a -le 0 ];then
	echo "yum不可用"
	exit
fi
yum -y install gcc openssl-devel pcre-devel
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2
./configure
make
make install
