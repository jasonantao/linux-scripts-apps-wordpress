#Pulling sql commands from .sql file cmds to which commands in sql are run to create wordpress ready database and exit mysql
#NOTE: MYSQL FIRST CAN TO BE INSTALLED
#NOT REQUIRED, BUT IF IT IS, WILL JUST SKIP A STEP IN WORDPRESS LOGIN SETUP PRELIMS
#THIS WAY, THIS SCRIPT WORKS NO MATTER WHICH LINUX INSTANCE YOU LAUNCH!!!!!
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
