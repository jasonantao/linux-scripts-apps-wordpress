#. ./env/setEnv.sh $*
#MySQL Params
echo 'The dbName is: ' $1
export dbName=$1
echo 'The userName is: ' $2
export userName=$2
echo 'The dbpwd is: ' $3
export dbpwd=$3
echo 'The sitename is: ' $4
export sitename=$4

# #Install Web Server
. ./install/installwebserver.sh

# #Install php-mysql
. ./install/installphpmysql.sh

# #Install WordPress
. ./install/installwordpress.sh

# #Install MySQL
. ./install/installmysql.sh

# #Configure WordPress
. ./install/configurewp.sh

