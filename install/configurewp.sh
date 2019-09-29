#Configure WordPress

wpConfigDir=$PWD
cd /$installDir/install/
echo "--------------------------------------------------------- HERE WP Config -----------------------------------------------------"
mkdir /var/www/html/$sitename
cp -a /var/www/html/wordpress/. /var/www/html/$sitename/
cp wp-config.php /var/www/html/$sitename/
cd /var/www/html/$sitename/
chmod 777 wp-config.php
echo "----------------------------------------------------- HERE ARGS ENTRY ----------------------------------------------------"


#Can now change wp-config.php here
#sed -i  's/DB_NAME/jasontest/' wp-config.php - This is the format of sed commands to use
sed -i  "s/wpconfig1/${dbName}/" wp-config.php
sed -i  "s/wpconfig2/${userName}/" wp-config.php
sed -i  "s/wpconfig3/${dbpwd}/" wp-config.php


mysql -u root -e "CREATE DATABASE ${dbName}"
mysql -u root -D $dbName -e "GRANT ALL PRIVILEGES ON ${dbName}.* TO '${userName}'@'localhost' IDENTIFIED BY '${dbpwd}'"
mysql -u root -e "FLUSH PRIVILEGES"
exit;

