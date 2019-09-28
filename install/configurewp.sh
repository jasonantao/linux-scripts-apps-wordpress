#Configure WordPress

wpConfigDir=$PWD
cd /$installDir/install/
cp wp-config.php /var/www/html/wordpress/
cd /var/www/html/wordpress/
chmod 777 wp-config.php

mysql -u root -e "CREATE DATABASE ${dbName}"
mysql -u root -D wpconfig -e "GRANT ALL PRIVILEGES ON ${dbName}.* TO '${dbName}'@'localhost' IDENTIFIED BY '${dbpwd}'"
mysql -u root -e "FLUSH PRIVILEGES"
exit;

