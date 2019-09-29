#!/bin/bash

#Setting reference to the current directory
wpCurrDir=$PWD

echo "The order of arguments is Mysql dbName, userName, dbpwd"

# Ensure script is running under root
if [ "$EUID" -ne 0 ]
  then echo "Error Cannot Proceed, Must Run as Root or Under Sudo"
  return -1
fi

#Git initialization installation
yum install git -y

#Set Cloning Properties
#Need to setup to install wordpress under scripts/apps/
pkg=wordpress
gitRepo="linux-scripts-apps-wordpress.git"
installDir="/tmp/apps/wordpress"
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
. ./setup.sh $* 2>&1| tee setup.log


cd $wpCurrDir

