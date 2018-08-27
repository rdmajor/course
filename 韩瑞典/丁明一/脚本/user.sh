#!/bin/bash
read -p "请输入用户名:" user
if [ -z $user ];then
	echo "您没有输入用户名,已自动退出"
	exit
else
	useradd $user &> /dev/null
	while [ $? -ne 0 ]
	do
		echo "用户已存在,请输入其他用户名"
		read -p "请输入用户名:" user
		useradd $user &> /dev/null
		[ $? -eq 0 ] && break
	done
		stty -echo
		read -p "请输入密码(不输密码默认为123456):" pass
		stty echo
		pass=${pass:-123456}
		echo $pass | passwd --stdin $user &> /dev/null
		echo
		echo "$user用户创建成功"
fi
