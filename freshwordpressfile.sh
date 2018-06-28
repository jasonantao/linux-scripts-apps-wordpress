#!/bin/bash

sqlCurrDir=$PWD

# Ensure script is running under root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  return -1
fi


cd $HOME
mkdir /var/tmp/www/
cd /var/tmp/www/

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* ./


rmdir ./wordpress/
rm -f latest.tar.gz

yum install git -y

#Set Cloning Properties
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


# Setup Project
#./setup.sh
#mysql -u root < cmds.txt;
mysql -u root
create database mywpwebsite;
USE mywpwebsite;
source /tmp/wordpress/cmds.sql
exit;

cd $HOME
