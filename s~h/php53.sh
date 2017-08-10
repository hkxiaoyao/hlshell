#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
rm -rf /root/p* /root/u* u* p*
PREFIX="/vhs/kangle/ext/php53"
phpv=`"$PREFIX"/bin/php -v |grep "$PHP53" -o`
file="php-$PHP53.tar.bz2"
file2="config.xml"
ZEND_ARCH="i386"
LIB="lib"
if test `arch` = "x86_64"; then
        LIB="lib64"
        ZEND_ARCH="x86_64"
fi
if [ "$PHP53" = "$phpv" ];
then {
clear
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2016
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
echo "开始安装PHP-"$PHP53""
yum -y install patch
if [ ! -s "$file" ];
then {
wget $DOWNLOAD_FILE_URL/file/php-$PHP53.tar.bz2 -O php-$PHP53.tar.bz2
tar xjf php-$PHP53.tar.bz2
}
else {
tar xjf php-$PHP53.tar.bz2
}
fi
cd php-$PHP53
wget $DOWNLOAD_FILE_URL/file/php5.3patch -O php5.3patch
patch -p1 < ./php5.3patch
CONFIG_CMD="./configure --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB --enable-fastcgi --with-mysql --with-mysqli --with-pdo-mysql --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --disable-fileinfo --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar"
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
	Copyright © 2015-2016
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
已检测您的系统安装PHP-$PHP53失败.请联系作者帮助
作者保证开发此脚本绝对:
\033[32m 开源|免费|绿色|安全|高效|零后门|零木马|零监控| \033[0m

————————————————————————————————————————————————————";
	touch /root/$PHP53-erro
	exit 1
else
make
make install
mkdir -p $PREFIX/etc/php.d
wget $DOWNLOAD_URL/config_file/php53.ini -O $PREFIX/php-templete.ini
wget $DOWNLOAD_URL/config_file/php53.xml -O $PREFIX/config.xml
#install zend
mkdir -p $PREFIX/zend
mkdir -p $PREFIX/ioncube
wget $DOWNLOAD_FILE_URL/file/zend-php53-$ZEND_ARCH.tar.bz2 -O zend-php53-$ZEND_ARCH.tar.bz2
tar xjf zend-php53-$ZEND_ARCH.tar.bz2
cd zend-php53-$ZEND_ARCH
rm -rf $PREFIX/zend/ZendGuardLoader.so
mv -f ZendGuardLoader.so $PREFIX/zend/ZendGuardLoader.so
rm -rf $PREFIX/ioncube/*
cd $PREFIX/ioncube/
wget -q $DOWNLOAD_FILE_URL/file/ioncube-$ZEND_ARCH-5.3.zip
unzip ioncube-$ZEND_ARCH-5.3.zip

# rm -rf $PREFIX/ioncube/ioncube_loader_lin_5.3.so
# mv -f ioncube_loader_lin_5.3.so $PREFIX/ioncube/ioncube_loader_lin_5.3.so
wget $DOWNLOAD_FILE_URL/file/memcache-3.0.8.tar.gz
tar zxf memcache-3.0.8.tar.gz
cd memcache-3.0.8
$PREFIX/bin/phpize
./configure --with-php-config=$PREFIX/bin/php-config
make
make install
rm -rf /tmp/*
/vhs/kangle/bin/kangle
/vhs/kangle/bin/kangle -r
rm -rf php-$PHP53
echo -e "————————————————————————————————————————————————————
	╦ ╦╦  ╔═╗╦ ╦╔══ ╦  ╦   ╔═╗╔═╗╔╦╗
	╠═╣║  ╚═╗╠═╣╠══ ║  ║   ║  ║ ║║║║
	╩ ╩╩═╝╚═╝╩ ╩╚══ ╩═╝╩═╝.╚═╝╚═╝╩ ╩
	Copyright © 2015-2016
	\033[32;5m狐狸脚本提醒您\033[0m
————————————————————————————————————————————————————
已检测您的系统成功安装PHP-$PHP53.谢谢您的使用
作者保证开发此脚本绝对:
\033[32m 开源|免费|绿色|安全|高效|零后门|零木马|零监控| \033[0m
————————————————————————————————————————————————————"
exit 0
fi
}
fi
