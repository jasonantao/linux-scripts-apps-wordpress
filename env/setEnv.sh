# WILDFLY CONFIGURATION PARAMETERS
pkg=mySql
mySqlAdmin=admin
mySqlOwner=mySql
mySqlGroup=mySql
mySqlHome=/opt/mySql
mySqlLog=/var/log/mySql

#MySQL Params
echo 'The dbName is: ' $1
export dbName=$1
echo 'The userName is: ' $2
export userName=$2
echo 'The dbpwd is: ' $3
export dbpwd=$3
