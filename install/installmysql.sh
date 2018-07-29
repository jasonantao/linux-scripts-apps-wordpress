#Install MySQL
echo 'Installing mysql server'
echo =================================================================================
echo BEFORE PWD = $PWD
wpDir=$PWD

rpm -qa | grep mysql
yum install mysql-server -y
service mysqld status
service mysqld start

#mysql -u root
#source /tmp/wordpress/install/wpcmds.sql

#mySQLInstallDir=$PWD/install
#Source $mySQLInstallDir/wpcmds.sql

cd /tmp/wordpress/
source ./install/wpcmds.sql

exit;
echo =================================================================================
echo AFTER PWD = $PWD
cd $wpDir

