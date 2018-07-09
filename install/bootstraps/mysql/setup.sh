#! /bin/bash
# INSTALL MYSQL ON LINUX WITH REMOTE ACCESS AS A SERVICE
# SETUP MYSQL CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

#Configuring MySQL for autmatic startup on reboot
#chkconfig mysqld on

mysql
echo "You are now done and have installed mySQL Thank you for using this script by Jason Antao"

#Feel free to use below, for debugging purposes, or to show capabilities
#mysql> create database jason
#mysql> GRANT ALL PRIVILEGES ON root.* TO root@localhost IDENTIFIED BY 'root';
#mysql> FLUSH PRIVILEGES;

mysql> exit
echo "You are now done and have installed mySQL Thank you for using this script by Jason Antao"
