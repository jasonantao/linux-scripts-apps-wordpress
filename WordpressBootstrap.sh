#!/bin/bash

#Setting reference to the current directory
wpCurrDir=$PWD

# Ensure script is running under root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  return -1
fi

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

cd ./install/bootstraps/mysql/
./mySQLBootstrap.sh

cd $installDir
./setup.sh

cd $wpCurrDir

###################### Testing below ###########################

cd /tmp/wordpress/install/
cp wp-config.php /var/www/html/wordpress/
cd /var/www/html/wordpress/
chmod 777 wp-config.php

mysql -u root
CREATE DATABASE jason;
GRANT ALL PRIVILEGES ON jason.* TO "jason"@"localhost" IDENTIFIED BY "jason";
FLUSH PRIVILEGES;
exit;

