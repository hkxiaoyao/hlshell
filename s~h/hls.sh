#!/bin/bash
files="/etc/s-hell"
source $files/cfg
source $files/iver
PREFIX="/vhs/kangle"
HLPANEL_VERSION="1.1.3"

function setup_hlpanel
{
	#close selinux make  zend optimizer Effect
	setenforce 0
	sed -i '/SELINUX/s/enforcing/disabled/' /etc/selinux/config
	if [ -f /vhs/kangle/nodewww/webftp/framework/runtime.php ] ; then
		E_LOCAL_VER=`cat /vhs/kangle/nodewww/webftp/framework/install.lock |grep -E "[.0-9]+" -o`
		if [ $E_LOCAL_VER != "" ] ; then
			echo "hlpanel install version=$E_LOCAL_VER";
			echo "hlpanel new version=$HLPANEL_VERSION"
			check_ver $HLPANEL_VERSION $E_LOCAL_VER
			HLPANEL_check=$?
       			if [ "$HLPANEL_check" == 2 ] ; then
               			echo "hlpanel check=$HLPANEL_check"
				return;
     	 		fi
		fi
	fi
	# if [ ! -f /var/lib/php/session ] ; then
                # mkdir /var/lib/php/session
                # chmod 777 /var/lib/php/session
                # chmod a+t /var/lib/php/session
        # fi
	# chmod 700 $PREFIX/etc $PREFIX/var $PREFIX/nodewww/data
	rm -rf hlpanel-$HLPANEL_VERSION
	rm -rf hlpanel-$HLPANEL_VERSION.tar.gz
	HLPANEL_URL="file/hlpanel-$HLPANEL_VERSION.tar.gz"
	EA_FILE_NAME="hlpanel-$HLPANEL_VERSION.tar.gz"
	wget $DOWNLOAD_FILE_URL/$HLPANEL_URL -O $EA_FILE_NAME
	if [ $? != 0 ] ; then
        	exit $?
	fi

	tar zxf $EA_FILE_NAME
	if [ $? != 0 ] ; then
        	exit $?
	fi
	/vhs/kangle/bin/kangle -q
	killall php-cgi
	\cp -a hlpanel-$HLPANEL_VERSION/* /vhs/kangle/
	/vhs/kangle/bin/kangle
	if [ $? != 0 ] ; then
       		 exit $?
	fi


	echo "hlpanel-$HLPANEL_VERSION setup success.............................................................................."
}

function write_partner
{
	partner=`echo $0|grep -o "ep_[^.]*"|cut -b 4-`
	echo $partner > $PREFIX/nodewww/webftp/partner.txt
}

setup_hlpanel
write_partner
wget  http://localhost:3312/upgrade.php -O /dev/null -q
echo "安装/更新完成"
