#. ./env/setEnv.sh $*
#MySQL Params
#Change to this
echo Setting External Args
echo These Arguments Overwrite Default Argument Settings
for arg in "$@"; do
  echo setArgs EXECUTING: export $arg
  export $arg
done

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

