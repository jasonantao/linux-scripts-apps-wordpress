#!/bin/bash

#Setting reference to the current directory
sqlCurrDir=$PWD

# Ensure script is running under root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  return -1
fi

###################################################################################
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

###################################################################################
cd /tmp/wordpress/install/bootstraps/mysql/

./mySQLBootstrap.sh

cd $HOME

###################################################################################
#Installing httpd and starting service.
yum install httpd -y
service httpd start

#Installing php-mysql
#In order to take effect, need a restart on httpd service
yum install php php-mysql -y
service httpd restart

#cd /tmp/scripts/db/mySQL/
cd /tmp/wordpress/
./setup.sh

cd $HOME

