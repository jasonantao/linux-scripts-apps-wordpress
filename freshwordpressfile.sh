#!/bin/bash

cd $HOME
mkdir /var/tmp/www/
cd /var/tmp/www/

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* ./


rmdir ./wordpress/
rm -f latest.tar.gz

mysql -u root


create database website;
grant usage on *.* to admin@localhost identified by 'password';
grant all privileges on website.* to admin@localhost;

use website;
exit;

echo "WordPress has now succesfully been installed and a database created."
