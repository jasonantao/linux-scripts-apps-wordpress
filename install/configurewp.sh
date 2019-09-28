#Configure WordPress

wpConfigDir=$PWD
cd /$installDir/install/
cp wp-config.php /var/www/html/wordpress/
cd /var/www/html/wordpress/
chmod 777 wp-config.php

mysql -u root -e "CREATE DATABASE wpconfig"
mysql -u root -D wpconfig -e "GRANT ALL PRIVILEGES ON wpconfig.* TO 'wpconfig'@'localhost' IDENTIFIED BY 'david'"
mysql -u root -e "FLUSH PRIVILEGES"
exit;

