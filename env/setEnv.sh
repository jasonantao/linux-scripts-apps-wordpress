# WILDFLY CONFIGURATION PARAMETERS
pkg=mySql
mySqlAdmin=admin
mySqlOwner=mySql
mySqlGroup=mySql
mySqlHome=/opt/mySql
mySqlLog=/var/log/mySql

#MySQL Params
echo 'The dbName is: ' $1
dbName=$1
echo 'The userName is: ' $2
userName=$2
echo 'The dbpwd is: ' $3
dbpwd=$3
