##!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
rm -rf /root/p* /root/u* u* p*
PREFIX="/vhs/kangle/ext/hlp"
phpv=`"$PREFIX"/bin/php -v |grep "$PHP54" -o`
file="php-$PHP54.tar.bz2"
ZEND_ARCH="i486"
LIB="lib"
cd
if test `arch` = "x86_64"; then
        LIB="lib64"
        ZEND_ARCH="x86_64"
fi
if [ "$PHP54" = "$phpv" ];
then {
clear
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2017
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
狐狸脚本检测到您已安装了 PHP-"$phpv"
不需要重复再次编译安装
————————————————————————————————————————————————————"
exit 1
}
else
{
if [ ! -s "$file" ];
then {
wget $DOWNLOAD_FILE_URL/file/php-$PHP54.tar.bz2 -O php-$PHP54.tar.bz2
tar xjf php-$PHP54.tar.bz2
}
else {
tar xjf php-$PHP54.tar.bz2
}
fi
cd php-$PHP54
CONFIG_CMD="./configure --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB --enable-fastcgi --with-mysql --with-mysqli --with-pdo-mysql --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --disable-fileinfo --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar"
if [ -f /usr/include/mcrypt.h ]; then

    CONFIG_CMD="$CONFIG_CMD --with-mcrypt"
fi
$CONFIG_CMD
if test $? != 0; then
echo $CONFIG_CMD
touch /root/$PHP54-erro
exit 1
else
make
make install
mkdir -p $PREFIX/etc/php.d
wget $DOWNLOAD_URL/config_file/php-node.ini -O $PREFIX/php-templete.ini
wget $DOWNLOAD_URL/config_file/nodephp.xml -O $PREFIX/config.xml
#install zend
wget $DOWNLOAD_FILE_URL/file/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-$ZEND_ARCH.tar.gz -O ZendGuardLoader-70429-PHP-5.4-linux-glibc23-$ZEND_ARCH.tar.gz
tar zxf ZendGuardLoader-70429-PHP-5.4-linux-glibc23-$ZEND_ARCH.tar.gz
cd ZendGuardLoader-70429-PHP-5.4-linux-glibc23-$ZEND_ARCH/php-5.4.x
mkdir -p $PREFIX/zend
rm -rf $PREFIX/zend/ZendGuardLoader.so
mv -f ZendGuardLoader.so $PREFIX/zend/ZendGuardLoader.so
#install ioncube
wget $DOWNLOAD_FILE_URL/file/ioncube-$ZEND_ARCH-5.4.zip -O ioncube-$ZEND_ARCH-5.4.zip
unzip ioncube-$ZEND_ARCH-5.4.zip
mkdir -p $PREFIX/ioncube
rm -rf $PREFIX/ioncube/ioncube_loader_lin_5.4.so
mv -f ioncube_loader_lin_5.4.so $PREFIX/ioncube/ioncube_loader_lin_5.4.so
rm -rf /tmp/*
/vhs/kangle/bin/kangle
/vhs/kangle/bin/kangle -r
rm -rf php-$PHP54
clear
echo -e "hlp安装完成"
exit 0
fi
}
fi
