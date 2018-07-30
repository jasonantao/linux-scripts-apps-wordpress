#Configure WordPress

wpConfigDir=$PWD
cd /tmp/wordpress/install/
cp wp-config.php /var/www/html/wordpress/
cd /var/www/html/wordpress/
chmod 777 wp-config.php

mysql -u root -e "CREATE DATABASE jason"
mysql -u root -D jason -e "GRANT ALL PRIVILEGES ON jason.* TO 'jason'@'localhost' IDENTIFIED BY 'jason'"
mysql -u root -e "FLUSH PRIVILEGES"
exit;

echo ===================== 'Done MySQL' ===================================

