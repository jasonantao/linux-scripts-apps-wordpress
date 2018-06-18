# Setup site folder
mkdir ~/Sites/$1
cd ~/Sites/$1
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress/ ~/Sites/$1/wp
rm latest.tar.gz

# Copy starter theme
cd ~/Sites/$1
wget http://github.com/toddmotto/html5blank/archive/stable.zip
unzip stable.zip
mv html5blank-stable/ ~/Sites/$1/wp/wp-content/themes/$1
rm stable.zip

###########################################################################
# Setup MySQL Database
mysql.server start
mysql -u root -e “create database $1”;
mysql -u root -e “create user ‘$1’@’localhost’ identified by password ‘’”;
mysql -u root -e “GRANT ALL PRIVILEGES ON $1.* TO $1@localhost”;
mysql -u root -e “FLUSH PRIVILEGES”;
############################################################################
# Create config file
cd ~/Sites/$1/wp
wp core config — dbname=$1 — dbuser=$1
wp core install — url=http://$1.wp — title=$1 — admin_user=admin — admin_password=admin — admin_email=greg@brllnt.co
#############################################################################
# Install and activate theme and plugins
wp theme activate $1
rm -rf ~/Sites/$1/wp/wp-content/themes/twentyfourteen
rm -rf ~/Sites/$1/wp/wp-content/themes/twentyfifteen
rm -rf ~/Sites/$1/wp/wp-content/themes/twentysixteen
rm -rf ~/Sites/$1/wp/wp-content/plugins/akismet
rm ~/Sites/$1/wp/wp-content/plugins/hello.php
mkdir ~/Sites/$1/wp/wp-content/plugins/advanced-custom-fields-pro
cp -r ~/wordpress-plugins/advanced-custom-fields-pro/* ~/Sites/$1/wp/wp-content/plugins/advanced-custom-fields-pro
wp plugin activate advanced-custom-fields-pro
