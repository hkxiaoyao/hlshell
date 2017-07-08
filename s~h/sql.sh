#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
os="Centos5.X-6.X"
File1="/etc/yum.repos.d"
File2="/etc/pki/rpm-gpg"
Filename1="mysql-community.repo"
Filename2="mysql-community-source.repo"
Filename3="RPM-GPG-KEY-mysql"
Filename1a="mysql_5.5.repo"
Filename2a="mysql_5.5s.repo"
Filename1b="mysql_5.6.repo"
Filename2b="mysql_5.6s.repo"
User="root"
Pass="mysql"
Db="mysql"
#开始安装MySQL官方Yum源
cd /tmp
# ck=`mysql -V|cut -d ' ' -f1`
# my='mysql'

# echo '开始安装mysql'
service mysqld restart
# rpm -ivh $DOWNLOAD_URL/file/my/5.6/mysql-community-bench-5.6.36-2.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/5.6/mysql-community-client-5.6.36-2.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/5.6/mysql-community-common-5.6.36-2.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/5.6/mysql-community-devel-5.6.36-2.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/5.6/mysql-community-embedded-devel-5.6.36-2.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/5.6/mysql-community-libs-compat-5.6.36-2.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/5.6/mysql-community-server-5.6.36-2.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/5.6/mysql-community-test-5.6.36-2.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/mysql-community-client-5.7.18-1.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/mysql-community-common-5.7.18-1.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/mysql-community-embedded-5.7.18-1.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/mysql-community-devel-5.7.18-1.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/mysql-community-embedded-devel-5.7.18-1.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/mysql-community-libs-compat-5.7.18-1.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/mysql-community-server-5.7.18-1.el6.x86_64.rpm
# rpm -ivh $DOWNLOAD_URL/file/my/mysql-community-test-5.7.18-1.el6.x86_64.rpm
chown -R mysql:mysql  /var/lib/mysql
rm -rf /var/lib/mysql/ibdata1
rm -rf /var/lib/mysql/ib_logfile0
rm -rf /var/lib/mysql/ib_logfile1
service mysqld restart
chkconfig --level 2345 mysqld on
wget -q $DOWNLOAD_URL/config_file/my.cnf -O /etc/my.cnf
#重置MySQL密码与修正MySQL升级后的bug
wget -q $DOWNLOAD_URL/s~h/reset.sh -O reset.sh;sh reset.sh
mysql_upgrade -uroot mysql
service mysqld restart
mysql -u$User -p$Pass -D $Db -e "ALTER TABLE user ADD Create_tablespace_priv ENUM('N','Y') NOT NULL DEFAULT 'N' AFTER Trigger_priv;"
mysql -u$User -p$Pass -D $Db -e "ALTER TABLE user ADD plugin CHAR(64) NULL AFTER max_user_connections;"
mysql -u$User -p$Pass -D $Db -e "ALTER TABLE user ADD authentication_string TEXT NULL DEFAULT NULL AFTER plugin;"
mysql -u$User -p$Pass -D $Db -e "ALTER TABLE user ADD password_expired ENUM('N','Y') NOT NULL DEFAULT 'N' AFTER authentication_string;"
service mysqld restart
echo '完成安装mysql'

