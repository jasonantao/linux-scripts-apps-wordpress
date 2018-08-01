#Install MySQL
#echo '===================== Installing mysql server ==================================='
echo BEFORE PWD = $PWD
wpDir=$PWD

rpm -qa | grep mysql
yum install mysql-server -y
service mysqld status
service mysqld start

cd $installDir
#source ./install/wpcmds.sql

#exit;
cd $wpDir

