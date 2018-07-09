#!/bin/bash

#Setting reference to the current directory
sqlCurrDir=$PWD

# Ensure script is running under root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  return -1
fi

#Generating directory for which website and wordpress will be installed
cd $HOME
mkdir /var/tmp/www/
cd /var/tmp/www/

#Getting wordpress latest tar file
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz

#Moving wordpress files back one step in the directory
mv wordpress/* ./

#Removing unecessary files from the fore mentioned file shift
rmdir ./wordpress/
rm -f latest.tar.gz

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


# Setup Project
#Note: Do not, and cannot use setup.sh in this case to run .sql file with SQL commands
#./setup.sh

#Logging into mysql to run commands
mysql -u root

#Creating database mywpwebsite and setting it to be used with running commands
create database mywpwebsite;
USE mywpwebsite;

#Pulling sql commands from .sql file cmds to which commands in sql are run to create wordpress ready database and exit mysql
source /tmp/wordpress/cmds.sql
exit;

cd $HOME
