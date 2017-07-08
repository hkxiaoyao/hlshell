#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
rm -rf /root/p* /root/u* u* p*
PREFIX="/vhs/kangle/ext/php70"
phpv=`"$PREFIX"/bin/php -v |grep "$PHP7" -o`
file="php-$PHP7.tar.bz2"
ZEND_ARCH="i386"
LIB="lib"

if test `arch` = "x86_64"; then
        LIB="lib64"
        ZEND_ARCH="x86_64"
fi
if [ "$PHP7" = "$phpv" ];
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
wget $DOWNLOAD_FILE_URL/file/php-$PHP7.tar.bz2 -O php-$PHP7.tar.bz2
tar xjf php-$PHP7.tar.bz2
}
else {

tar xjf php-$PHP7.tar.bz2
}
fi
cd php-$PHP7
CONFIG_CMD="./configure --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB --enable-fastcgi --enable-mysqlnd --with-mysql-sock=/var/run/mysql/mysql.sock --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --disable-fileinfo --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-openssl --with-mhash --with-ssh2"
if [ -f /usr/include/mcrypt.h ]; then
        CONFIG_CMD="$CONFIG_CMD --with-mcrypt"
fi
$CONFIG_CMD
if test $? != 0; then
{
	echo $CONFIG_CMD
		echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2017
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
已检测您的系统安装PHP-$PHP7失败.请联系作者帮助
作者保证开发此脚本绝对:
\033[32m 开源|免费|绿色|安全|高效|零后门|零木马|零监控| \033[0m

————————————————————————————————————————————————————";
exit 1
}
else
{
make
make install
mkdir -p $PREFIX/etc/php.d
if [ ! -f $PREFIX/php-templete.ini ]; then
        cp php.ini-dist $PREFIX/php-templete.ini
fi
if [ ! -f $PREFIX/config.xml ]; then
        wget $phplink/php70.xml -O $PREFIX/config.xml
fi
echo "正在下载PHP7配置文件"
wget -q $DOWNLOAD_URL/config_file/php70.xml -O $PREFIX/config.xml
wget -q $DOWNLOAD_URL/config_file/php70.ini -O $PREFIX/php-templete.ini
#install ioncube
echo "正在下载ioncube组件"
wget -q $DOWNLOAD_FILE_URL/file/ioncube-$ZEND_ARCH-7.0.zip
echo "正在解压文件"
unzip ioncube-$ZEND_ARCH-7.0.zip
echo "正在安装ioncube组件"
mkdir -p $PREFIX/ioncube
rm -rf $PREFIX/ioncube/ioncube_loader_lin_7.0.so
mv -f ioncube_loader_lin_7.0.so $PREFIX/ioncube/ioncube_loader_lin_7.0.so
echo "ioncube组件安装完成"
wget -q https://www.libssh2.org/download/libssh2-1.8.0.tar.gz
tar -zxvf libssh2-1.8.0.tar.gz
cd libssh2-1.8.0
./configure
make && make install
wget -q http://pecl.php.net/get/ssh2-1.0.tgz
tar -zxvf ssh2-1.0.tgz
cd ssh2-1.0
$PREFIX/bin/phpize
./configure --with-php-config=$PREFIX/bin/php-config
make && make install
echo "正在清理编译后的垃圾"
rm -rf /tmp/*
/vhs/kangle/bin/kangle -r
rm -rf php-$PHP7 *
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2017
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
已检测您的系统成功安装PHP-$PHP7.谢谢您的使用
作者保证开发此脚本绝对:
\033[32m 开源|免费|绿色|安全|高效|零后门|零木马|零监控| \033[0m
————————————————————————————————————————————————————"
}
fi
}
fi
