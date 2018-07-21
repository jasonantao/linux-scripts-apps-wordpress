#Install php-mysql
echo 'Installing php-mysql'
#In order to take effect, need a restart on httpd service
yum install php php-mysql -y
service httpd restart
