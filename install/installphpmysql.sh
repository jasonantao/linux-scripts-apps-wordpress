#Install php-mysql
echo 'Installing php-mysql'
#In order to take effect, need a restart on httpd service
#yum install php php-mysql -y
yum install -y php73 php73-devel php73-mysql php73-pdo php73-mbstring
yum install -y php73-gd php73-xml php73-xmlrpc php73-mcrypt php-pear
service httpd restart
