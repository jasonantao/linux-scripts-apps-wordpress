#!/bin/bash
sqlCurrDir=$PWD

# Ensure script is running under root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  return -1
fi

#Initial update of server
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update -y

# Finally Install MySQL as usual and start the service. 
yum repolist enabled | grep "mysql.*-community.*"
#yum install mysql56-server -y
yum install mysql-community-server -y
service mysqld start

#n
#n
#n
#n
#n

#Installation of Required Programs
#--Git
#--MySQL
yum install git -y

#yum -q -y install mysql-server

#Set Cloning Properties
pkg=mySQL
gitRepo="linux-scripts-apps-mysql.git"
installDir="/tmp/scripts/db/mySQL"

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
find . -name "*.sh" -exec chmod 700 {} \;

# Setup Project
./setup.sh
#./setup.sh 2>&1| tee setup.log
;
exit;
cd $mySqlCurrDir
echo "You are now done and have installed mySQL Thank you for using this script by Jason Antao"
#Add exit statement
ls
#For second Linux AMI from AWS below
sudo su
yum install mysql -y
mysql --version
