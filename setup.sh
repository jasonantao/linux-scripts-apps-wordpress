. ./env/setEnv.sh $*
#MySQL Params

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

