#!/bin/bash
read -p "请输入需要开机的主机名称" zhuji
case $zhuji in
client)
	virsh start client;;
proxy)
	virsh start proxy;;
web1)
	virsh start web1;;
web2)	
	virsh start web2;;
*)
	echo Error;;
esac
