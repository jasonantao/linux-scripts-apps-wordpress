#Install Web Server
. ./install/installwebserver.sh

#Install php-mysql
. ./install/installphpmysql.sh

#Install WordPress
. ./install/installwordpress.sh
echo HERE "1 ========================= After . ./install/installwordpress.sh PWD = $PWD ===================================="

#Install MySQL
. ./install/installmysql.sh
echo HERE "2 ========================= After . ./install/installmysql.sh = $PWD ===================================="

#Configure WordPress
. ./install/configurewp.sh
echo HERE "3 ========================= After . ./install/configurewp.sh PWD = $PWD ===================================="
