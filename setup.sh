#Installing httpd and starting service.
yum install httpd -y
service httpd start

#Installing php-mysql
#In order to take effect, need a restart on httpd service
yum install php php-mysql -y
service httpd restart

#cd /tmp/scripts/db/mySQL/



cd /var/www/html
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

#Initial message - will repeat
echo "Wordpress Installation Complete"
echo "Go to http://your_ip_adress/wordpress to launch your blank wordpress site."

#Pulling sql commands from .sql file cmds to which commands in sql are run to create wordpress ready database and exit mysql
#NOTE: MYSQL FIRST CAN TO BE INSTALLED
#NOT REQUIRED, BUT IF IT IS, WILL JUST SKIP A STEP IN WORDPRESS LOGIN SETUP PRELIMS
#THIS WAY, THIS SCRIPT WORKS NO MATTER WHICH LINUX INSTANCE YOU LAUNCH!!!!!
rpm -qa | grep mysql
yum install mysql-server -y
service mysqld status
service mysqld start

mysql -u root
source /tmp/wordpress/install/wpcmds.sql
exit;


#cd $HOME
#Exiting the two modularized sql command scripts that were run below.
#Test, required - mandatory step below, to ensure proper reset - everytime!!!
exit;
exit;
