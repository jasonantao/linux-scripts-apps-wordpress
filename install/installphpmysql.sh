#Install php-mysql

#In order to take effect, need a restart on httpd service
echo 'Installing php-mysql'
yum install php php-mysql -y
service httpd restart
