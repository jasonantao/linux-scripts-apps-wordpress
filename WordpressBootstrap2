#!/bin/bash

#Setting reference to the current directory
sqlCurrDir=$PWD

# Ensure script is running under root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  return -1
fi

yum install httpd
service httpd start

yum install php php-mysql
service httpd restart

#Git initialization installation
yum install git -y

#Set Cloning Properties
#Need to setup to install wordpress under scripts/apps/
pkg=wordpress
gitRepo="linux-scripts-apps-wordpress.git"
installDir="/tmp/wordpress"
if [ -f ~/.ssh/gitHub.key ]; then
   clone="git clone git@github.com:jasonantao/"
else
   clone="git clone https://github.com/jasonantao/"
fi

# Clone $pkg
echo Executing $clone$gitRepo $installDir
$clone$gitRepo $installDir
# Setup $pkg
cd $installDir
# MAKE ALL SHELL SCRIPTS EXECUTABLE TO ROOT ONLY
find . -name "*sh" -exec chmod 700 {} \;

cd /var/www/html
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

echo "Wordpress Installation Complete"
echo "Go to http://(your_ip_adress)/wordpress to launch your blank wordpress site.


#Pulling sql commands from .sql file cmds to which commands in sql are run to create wordpress ready database and exit mysql
source /tmp/wordpress/wpcmds.sql
exit;

cd $HOME
echo "Wordpress Installation Complete"
echo "Go to http://(your_ip_adress)/wordpress to launch your blank wordpress site.
