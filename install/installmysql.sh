#Install MySQL
echo 'Installing mysql server'
rpm -qa | grep mysql
yum install mysql-server -y
service mysqld status
service mysqld start

mysql -u root
source /tmp/wordpress/install/wpcmds.sql
exit;
exit;
exit;
