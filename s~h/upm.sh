#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
PREFIX="/vhs/kangle/nodewww/dbadmin"
PMV="$PREFIX/mysql/pm$PHPMY"
if [ ! -f "$PMV" ];
then {
cd $PREFIX
wget $DOWNLOAD_FILE_URL/file/phpMyAdmin-$PHPMY-all-languages.tar.bz2 -O phpMyAdmin-$PHPMY-all-languages.tar.bz2
tar xjf phpMyAdmin-$PHPMY-all-languages.tar.bz2
mv -f phpMyAdmin-$PHPMY-all-languages mysql
touch $PREFIX/mysql/pm$PHPMY
rm -rf /root/ws/wssh/mysql* u* p*
clear
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2016
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
狐狸脚本已为您安装完成 phpMyAdmin-"$PHPMY" 
感谢您的使用
————————————————————————————————————————————————————"
}
else
{
clear
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2016
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
狐狸脚本检测到您已安装了 phpMyAdmin-"$PHPMY" 
请问是否覆盖再次安装
————————————————————————————————————————————————————
覆盖:请输入 Y 不区分大小写 
不安装:请按下Enter键确认退出安装
————————————————————————————————————————————————————"
input_enter=""
read -p "" input_enter
if [ "$input_enter" = "y" ] || [ "$input_enter" = "Y" ]; then
rm -rf /root/ws/wssh/mysql* u* p*
rm -rf $PREFIX/mysql
clear
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2016
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
狐狸脚本检测到您确认覆盖安装 phpMyAdmin-"$PHPMY" 
正在进行覆盖安装
————————————————————————————————————————————————————"
wget -q $DOWNLOAD_FILE_URL/s~h/pm.sh -O pm
sh pm
else
clear
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2016
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
狐狸脚本检测到您确认退出覆盖安装 phpMyAdmin-"$PHPMY" 感谢您的使用
————————————————————————————————————————————————————"
exit 0
fi
}
fi
