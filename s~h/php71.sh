#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
rm -rf /root/p* /root/u* u* p*
PREFIX="/vhs/kangle/ext/php71"
phpv=`"$PREFIX"/bin/php -v |grep "$PHP71" -o`
file="php-$PHP71.tar.bz2"
ZEND_ARCH="i386"
LIB="lib"

if test `arch` = "x86_64"; then
        LIB="lib64"
        ZEND_ARCH="x86_64"
fi
if [ "$PHP71" = "$phpv" ];
then {
clear
echo -e "——————————————————————————————————————————————————————————————————
		╦ ╦╦  ╔═╗╦ ╦╔═╗╦  ╦   ╔═╗╔═╗╔╦╗
		╠═╣║  ╚═╗╠═╣║╣ ║  ║   ║  ║ ║║║║
		╩ ╩╩═╝╚═╝╩ ╩╚═╝╩═╝╩═╝o╚═╝╚═╝╩ ╩
	        Copyright © 2015-2017 \033[32;5m狐狸脚本提醒您\033[0m
——————————————————————————————————————————————————————————————————
狐狸脚本检测到您已安装了 PHP-"$phpv" 不需要重复再次编译安装
——————————————————————————————————————————————————————————————————"

}
else
{
if [ ! -s "$file" ];
then {
wget $DOWNLOAD_FILE_URL/file/php-$PHP71.tar.bz2 -O php-$PHP71.tar.bz2
tar xjf php-$PHP71.tar.bz2
}
else {

tar xjf php-$PHP71.tar.bz2
}
fi
cd php-$PHP71
CONFIG_CMD="./configure --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB --enable-fastcgi --enable-mysqlnd --with-mysql-sock=/var/run/mysql/mysql.sock --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --disable-fileinfo --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-openssl --with-mhash --with-sqlite3 --with-pdo-sqlite"
if [ -f /usr/include/mcrypt.h ]; then
        CONFIG_CMD="$CONFIG_CMD --with-mcrypt"
fi
$CONFIG_CMD
if test $? != 0; then
	echo $CONFIG_CMD
	echo "configure php error";
	exit 1
fi
make
make install
mkdir -p $PREFIX/etc/php.d
if [ ! -f $PREFIX/php-templete.ini ]; then
        cp php.ini-dist $PREFIX/php-templete.ini
fi
if [ ! -f $PREFIX/config.xml ]; then
        wget $phplink/php71.xml -O $PREFIX/config.xml
fi
wget $DOWNLOAD_URL/config_file/php71.xml -O $PREFIX/config.xml
wget $DOWNLOAD_URL/config_file/php71.ini -O $PREFIX/php-templete.ini
#install ioncube
wget $DOWNLOAD_FILE_URL/file/ioncube-$ZEND_ARCH-5.6.zip
unzip ioncube-$ZEND_ARCH-5.6.zip
mkdir -p $PREFIX/ioncube
mv ioncube_loader_lin_5.6.so $PREFIX/ioncube/ioncube_loader_lin_5.6.so
rm -rf /tmp/*
/vhs/kangle/bin/kangle
/vhs/kangle/bin/kangle -r
if test $? != 0; then
	echo $?
	clear
	echo "
$poweredby
$msg
			"$lang_19"
$msg";
else
clear
echo "
$poweredby
$msg
			"$lang_20"
$msg"
cd
rm -rf php-$PHP71
	exit 1
fi
}
fi
