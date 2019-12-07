# WILDFLY CONFIGURATION PARAMETERS
pkg=mySql
mySqlAdmin=admin
mySqlOwner=mySql
mySqlGroup=mySql
mySqlHome=/opt/mySql
mySqlLog=/var/log/mySql

#NOTE - THIS IS A SUB-NESTED LAYER AND SO EXPORTS MADE HERE WILL NOT BE AVAILABLE IN THE INDIVIDUAL INSTALL SCRIPTS
dbName=admin
userName=admin
dbpwd=pass
sitename=mynewsite
installDir=/opt/CI/bootstraps/apps/wordpress

echo Setting External Args
echo These Arguments Overwrite Default Argument Settings
for arg in "$@"; do
  echo setArgs EXECUTING: export $arg
  export $arg
done
