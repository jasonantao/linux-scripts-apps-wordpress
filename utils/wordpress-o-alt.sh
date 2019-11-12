#!/bin/bash
wpCurrDir=$PWD
#WARNING: TEST SCRIPT ON DEDICATED SERVER> SCRIPT IN PROGRESS AND MAY CAUSES UNINTENDED EFFECTS!

#Doesn't it make sense to just do sudo su instead of the if/else statement below? Please advise.
sudo su

#Checking for requirement that super-user is being run, otherwise do not proceed.
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  exit -1
fi

#Creating directory for WordPress Installation.
mkdir $wpCurrDir/var/www/html/
cd /etc
cd var
mkdir www
cd www
mkdir html
cd www

#Downloading Wordpress and extracting tar file
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz

#Moving wordpress files back to initial directory
mv wordpress/* ./

#Removing compressed file and unecessary directory
rmdir ./wordpress/
rm -f latest.tar.gz

#Link-up mySQL Script Below:
#Going back to originating directory
cd $wpCurrDir

#Cloning the package
echo Cloning the package
pkg=Web
gitRepo="linux-scripts-apps-mysql.git"

#Do I need an install directory for mySQL below? Please advise.
installDir="/tmp/scripts/apps/WEB"
if [ -f ~/.ssh/gitHub.key ]; then
   clone="git clone -b $branch git@github.com:jasonantao/"
else
   clone="git clone -b $branch https://github.com/jasonantao/"
fi

# Act of Cloning
echo Executing $clone$gitRepo $wpCurrDir
$clone$gitRepo $wpCurrDir

#Installing mySQLBootrap
. ./mySQLBootrap.sh

#Testing if db creation was succesful.
use db

echo End of Script
