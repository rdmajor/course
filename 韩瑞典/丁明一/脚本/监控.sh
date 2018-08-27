#!/bin/bash
cpu=`uptime | awk '{print $10}'`
echo "cpu15分钟的负载为:$cpu"
wangka=`ifconfig eth0 | awk '/RX p/{print $5}'`
echo "网卡入站流量为:$wangka"
free | awk '/Mem/{print "内存剩余容量:"$4}'
df | awk '/\/$/{print "磁盘剩余容量:"$4}'
wc -l /etc/passwd | awk '{print "账户数量为:"$1}'
user=`who | wc -l`
echo "当前登陆账户数量:$user"
ps=`ps aux | wc -l`
echo "当前开启的进程数量:$ps"
bao=`rpm -qa | wc -l`
echo "本机已安装的软件包数量:$bao"
