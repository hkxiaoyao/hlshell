#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
rpm -ivh $DOWNLOAD_URL/config_file/mysql-community-release-el6-5.noarch.rpm --nodeps --force
yum -y update mysql mysql-server mysql-devel
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2017
	狐狸脚本下载配置文件
————————————————————————————————————————————————————
更新完成-请重新编译PHP不然php对接数据库组件默认为5.1
作者保证开发此脚本绝对:
\033[32m 开源|免费|绿色|安全|高效|零后门|零木马|零监控| \033[0m
————————————————————————————————————————————————————"
