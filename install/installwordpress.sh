#Installing WordPress
echo 'Installing WordPress'
echo '===================== Executing installwordpress.sh ==================================='

wpInstallDir=$PWD
#First line below is correct
#cd /var/www/html
#mkdir /var/www/html/remco
cd /var/www/html/
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

#Initial message - will repeat
echo "Wordpress Installation Complete"
echo "Go to http://your_ip_adress/wordpress to launch your blank wordpress site."
cd $wpInstallDir
