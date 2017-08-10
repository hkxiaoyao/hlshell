#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
rm -rf /root/p* /root/u* u* p*
PREFIX="/vhs/kangle/ext/php55"
phpv=`"$PREFIX"/bin/php -v |grep "$PHP55" -o`
file="php-$PHP55.tar.bz2"
ZEND_ARCH="i586"
LIB="lib"

if test `arch` = "x86_64"; then
        LIB="lib64"
        ZEND_ARCH="x86_64"
fi
if [ "$PHP55" = "$phpv" ];
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
wget $DOWNLOAD_FILE_URL/file/php-$PHP55.tar.bz2 -O php-$PHP55.tar.bz2
tar xjf php-$PHP55.tar.bz2
}
else {
tar xjf php-$PHP55.tar.bz2
}
fi
cd php-$PHP55
CONFIG_CMD="./configure --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB --enable-fastcgi --with-mysql --with-mysqli --with-pdo-mysql --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --disable-fileinfo --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --enable-opcache"
if [ -f /usr/include/mcrypt.h ]; then
        CONFIG_CMD="$CONFIG_CMD --with-mcrypt"
fi
$CONFIG_CMD
if test $? != 0; then
echo $CONFIG_CMD
	echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2017
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
已检测您的系统安装PHP-$PHP55失败.请联系作者帮助
作者保证开发此脚本绝对:
\033[32m 开源|免费|绿色|安全|高效|零后门|零木马|零监控| \033[0m

————————————————————————————————————————————————————";
touch /root/$PHP55-erro
exit 1
else
make
make install
mkdir -p $PREFIX/etc/php.d
wget $DOWNLOAD_URL/config_file/php55.ini -O $PREFIX/php-templete.ini
wget $DOWNLOAD_URL/config_file/php55.xml -O $PREFIX/config.xml
#install zend
wget $DOWNLOAD_FILE_URL/file/zend-loader-php5.5-linux-$ZEND_ARCH.tar.gz
tar zxf zend-loader-php5.5-linux-$ZEND_ARCH.tar.gz
cd zend-loader-php5.5-linux-$ZEND_ARCH.tar.gz
mkdir -p $PREFIX/zend
rm -rf $PREFIX/zend/ZendGuardLoader.so
rm -rf $PREFIX/zend/opcache.so
mv -f ZendGuardLoader.so $PREFIX/zend/ZendGuardLoader.so
mv -f opcache.so $PREFIX/zend/opcache.so
#install ioncube
wget $DOWNLOAD_FILE_URL/file/ioncube-$ZEND_ARCH-5.5.zip
unzip ioncube-$ZEND_ARCH-5.5.zip
mkdir -p $PREFIX/ioncube
rm -rf $PREFIX/ioncube/ioncube_loader_lin_5.5.so
mv -f ioncube_loader_lin_5.5.so $PREFIX/ioncube/ioncube_loader_lin_5.5.so
wget $DOWNLOAD_FILE_URL/file/memcache-3.0.8.tar.gz
tar zxf memcache-3.0.8.tar.gz
cd memcache-3.0.8
$PREFIX/bin/phpize
./configure --with-php-config=$PREFIX/bin/php-config
make
make install
# wget $DOWNLOAD_FILE_URL/file/apcu-4.0.7.tar.gzapcu-4.0.7.tar.gz
# tar zxf apcu-4.0.7.tar.gz
# cd apcu-4.0.7
# $PREFIX/bin/phpize
# ./configure --with-php-config=$PREFIX/bin/php-config
# make
# make install
rm -rf /tmp/*
/vhs/kangle/bin/kangle
/vhs/kangle/bin/kangle -r
rm -rf php-$PHP55
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2017
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
已检测您的系统成功安装PHP-$PHP55.谢谢您的使用
作者保证开发此脚本绝对:
\033[32m 开源|免费|绿色|安全|高效|零后门|零木马|零监控| \033[0m
————————————————————————————————————————————————————"
exit 0
fi
}
fi
