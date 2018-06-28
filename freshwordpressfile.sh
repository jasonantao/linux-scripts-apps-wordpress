#!/bin/bash

cd $HOME
mkdir /var/tmp/www/
cd /var/tmp/www/

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* ./


rmdir ./wordpress/
rm -f latest.tar.gz


echo "WordPress has now succesfully been installed and a database created."
cd $HOME
