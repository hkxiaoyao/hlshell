#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
PREFIX="/vhs/kangle/nodewww/dbadmin"
PMV="$PREFIX/mysql/pm$PHPMY"
rm -rf $PREFIX/mysql
# mkdir $PREFIX/mysql
cd $PREFIX
wget $DOWNLOAD_FILE_URL/file/phpMyAdmin-$PHPMY-all-languages.tar.bz2 -O phpMyAdmin-$PHPMY-all-languages.tar.bz2
tar xjf phpMyAdmin-$PHPMY-all-languages.tar.bz2
mv -f $PREFIX/phpMyAdmin-$PHPMY-all-languages/ $PREFIX/mysql/
touch $PMV
rm -rf /root/ws/wssh/mysql* u* p*
clear
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2016
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
狐狸脚本已为您覆盖安装完成 phpMyAdmin-"$PHPMY"
感谢您的使用
————————————————————————————————————————————————————"
