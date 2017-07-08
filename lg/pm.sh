#!/bin/bash
source /root/cfg
source /root/iver
PREFIX="/vhs/kangle/nodewww/dbadmin"
PMV="$PREFIX/mysql/pm$PHPMY"
cd $PREFIX
wget $DOWNLOAD_FILE_URL/file/phpMyAdmin-$PHPMY-all-languages.tar.bz2 -O phpMyAdmin-$PHPMY-all-languages.tar.bz2
tar xjf phpMyAdmin-$PHPMY-all-languages.tar.bz2
cp -fr phpMyAdmin-$PHPMY-all-languages $PREFIX/mysql
touch $PMV
rm -rf /root/ws/wssh/mysql* u* p*
clear
echo -e "——————————————————————————————————————————————————————————————————
		╦ ╦╦  ╔═╗╦ ╦╔═╗╦  ╦   ╔═╗╔═╗╔╦╗
		╠═╣║  ╚═╗╠═╣║╣ ║  ║   ║  ║ ║║║║
		╩ ╩╩═╝╚═╝╩ ╩╚═╝╩═╝╩═╝o╚═╝╚═╝╩ ╩
	        Copyright ? 2015-2016 \033[32m狐狸脚本提醒您\033[0m
——————————————————————————————————————————————————————————————————
狐狸脚本已为您覆盖安装完成 phpMyAdmin-"$PHPMY" .感谢您的使用
——————————————————————————————————————————————————————————————————"

