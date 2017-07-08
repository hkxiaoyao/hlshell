#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
fil2="/vhs/kangle/nodewww/webftp/admin/control"
fil3="/vhs/kangle/nodewww/webftp"
wget -q $DOWNLOAD_FILE_URL/file/fixphp.tar.bz2 -O fixphp.tar.bz2
tar xjf fixphp.tar.bz2
#mv -f system.ctl.php $fixfile2/system.ctl.php
mv -f php.php $fil3/modules/php/php.php
rm -rf php.php
rm -rf fixphp.tar.bz2
rm -rf system.ctl.php
yum -y install mcrypt