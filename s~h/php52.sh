#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
rm -rf /root/p* /root/u* u* p*
PREFIX="/vhs/kangle/ext/php52"
phpv=`"$PREFIX"/bin/php -v |grep "$PHP52" -o`
file="php-$PHP52.tar.bz2"
ZEND_ARCH="i386"
LIB="lib"
if test `arch` = "x86_64"; then
        LIB="lib64"
        ZEND_ARCH="x86_64"
fi
if [ "$PHP52" = "$phpv" ];
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
clear
clear
echo "开始安装PHP-"$PHP52""
yum -y install patch
if [ ! -s "$file" ];
then {
wget $DOWNLOAD_FILE_URL/file/php-$PHP52.tar.bz2 -O php-$PHP52.tar.bz2
tar xjf php-$PHP52.tar.bz2
cd php-$PHP52
}
else {
tar xjf php-$PHP52.tar.bz2
cd php-$PHP52
}
fi
patch -p1 < ./php5.2patch
CONFIG_CMD="./configure --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB --enable-fastcgi --with-mysql --with-mysqli --with-pdo-mysql --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --disable-fileinfo --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --with-curlwrappers --enable-mbstring --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-openssl"
if [ -f /usr/include/mcrypt.h ]; then
        CONFIG_CMD="$CONFIG_CMD --with-mcrypt --with-mhash-dir"
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
已检测您的系统安装PHP-$PHP52失败.请联系作者帮助
作者保证开发此脚本绝对:
\033[32m 开源|免费|绿色|安全|高效|零后门|零木马|零监控| \033[0m

————————————————————————————————————————————————————";
	touch /root/$PHP52-erro
	exit 1
else
make
make install
mkdir -p $PREFIX/etc/php.d
echo "正在下载PHP"$PHP52"配置文件"
wget $DOWNLOAD_URL/config_file/php52.ini -O $PREFIX/php-templete.ini
wget $DOWNLOAD_URL/config_file/php52.xml -O $PREFIX/config.xml
cd ..
#install curl
# wget $DOWNLOAD_FILE_URL/file/curl-7.37.1.tar.gz
# tar zxvf curl-7.37.1.tar.gz
# cd curl-7.37.1
# ./configure --prefix=$PREFIX
# make && make install
#install zend
mkdir -p $PREFIX/zend
mkdir -p $PREFIX/ioncube
wget -q $DOWNLOAD_FILE_URL/file/zend-3.3.9-$ZEND_ARCH.tar.bz2 -O zend-3.3.9-$ZEND_ARCH.tar.bz2
tar xjf zend-3.3.9-$ZEND_ARCH.tar.bz2
cd zend-3.3.9-$ZEND_ARCH
rm -rf $PREFIX/zend/ZendOptimizer.so
mv ZendOptimizer.so $PREFIX/zend/ZendOptimizer.so
wget -q $DOWNLOAD_URL/config_file/zend-52.ini -O $PREFIX/etc/php.d/zend.ini
#install ioncube
wget -q $DOWNLOAD_FILE_URL/file/ioncube-$ZEND_ARCH-5.2.zip -O ioncube-$ZEND_ARCH-5.2.zip
unzip ioncube-$ZEND_ARCH-5.2.zip
rm -rf $PREFIX/ioncube/ioncube_loader_lin_5.2.so
mv -f ioncube_loader_lin_5.2.so $PREFIX/ioncube/ioncube_loader_lin_5.2.so
wget -q $DOWNLOAD_URL/config_file/ioncube-52.ini -O $PREFIX/etc/php.d/ioncube.ini
wget -q $DOWNLOAD_FILE_URL/file/memcache-3.0.8.tar.gz
tar zxf memcache-3.0.8.tar.gz
cd memcache-3.0.8
$PREFIX/bin/phpize
./configure --with-php-config=$PREFIX/bin/php-config
make
make install
rm -rf /tmp/*
/vhs/kangle/bin/kangle
/vhs/kangle/bin/kangle -r
rm -rf php-$PHP52
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2017
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
已检测您的系统成功安装PHP-$PHP52.谢谢您的使用
作者保证开发此脚本绝对:
\033[32m 开源|免费|绿色|安全|高效|零后门|零木马|零监控| \033[0m
————————————————————————————————————————————————————"
exit 0
fi
}
fi
