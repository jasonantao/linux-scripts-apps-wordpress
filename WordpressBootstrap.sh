#!/bin/bash

#Setting reference to the current directory
sqlCurrDir=$PWD

# Ensure script is running under root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  return -1
fi

#Installing httpd and starting service.
yum install httpd -y
service httpd start

#Installing php-mysql
#In order to take effect, need a restart on httpd service
yum install php php-mysql -y
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

#Setup for Wordpress Installation
#Directory setup and file installation setup and management
cd /var/www/html
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

#Initial message - will repeat
echo "Wordpress Installation Complete"
echo "Go to http://your_ip_adress/wordpress to launch your blank wordpress site.

#Pulling sql commands from .sql file cmds to which commands in sql are run to create wordpress ready database and exit mysql
#NOTE: MYSQL FIRST CAN TO BE INSTALLED
#NOT REQUIRED, BUT IF IT IS, WILL JUST SKIP A STEP IN WORDPRESS LOGIN SETUP PRELIMS
#THIS WAY, THIS SCRIPT WORKS NO MATTER WHICH LINUX INSTANCE YOU LAUNCH!!!!!
mysql -u root
source /tmp/wordpress/wpcmds.sql
exit;
exit;

cd $HOME
echo "Wordpress Installation Complete"
echo "Go to http://your_ip_adress/wordpress to launch your blank wordpress site.
