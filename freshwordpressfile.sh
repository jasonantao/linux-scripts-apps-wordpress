#!/bin/bash

if [ $# -lt 2 ]; then

echo "Error"
echo "Must provide 2 parameters:  db name/user and relative path eg 'name ../domain.com/'"
echo "Relative path MUST be one dir up"
else

ROOTPATH=$2httpdocs/
WPDBPASS=$(date +%s | sha256sum | base64 | head -c 10 ; echo)
URL=$2
URL="${URL/../http:/}"

# check if wordpress files present, delete or exit
if [ -d $ROOTPATH"wp-content" ]; then 
  echo -n "Worpdress files found. Delete Files? [y/N]: "
  read DELETE
  if [[ $DELETE = [Yy] ]]; then 
    rm -rf $ROOTPATH
    echo "Deleted folder $ROOTPATH"
  else
    exit 1
  fi
fi

echo -n "Enter root password to create database: "
RPASS=password


echo -n "Enter administrator password for wordpress: "
WPPASS=password

# set config with root user that can create db
if [ -d $ROOTPATH"wp-config.php" ]; then
  mv $ROOTPATH"wp-config.php" $ROOTPATH"wp-config.php.bak"
fi
RES=$( wp --path=$ROOTPATH core config --dbname=$1 --dbuser=root --dbpass=$RPASS )
if [[ $RES != *"Success"* ]]; then 
  if [ -d $ROOTPATH"wp-config.php.bak" ]; then
    mv $ROOTPATH"wp-config.php.bak" $ROOTPATH"wp-config.php"
  fi
  exit 1
fi
if [ -d $ROOTPATH"wp-config.php.bak" ]; then
  rm -f $ROOTPATH"wp-config.php.bak"
fi

#check if db exits, delete or exit
RES=$(wp --path=$ROOTPATH db query "SHOW DATABASES LIKE '$1';" )
if [[ ${#RES} -gt 0 ]]; then 
  echo -n "Database found, delete it? [y/N]:"
  read DELETE
  if [[ $DELETE = "y" ]]; then
    wp --path=$ROOTPATH db drop --yes
  else
    exit 1
  fi
fi

# create db, grant privileges and set user and install
wp --path=$ROOTPATH db create
wp  --path=$ROOTPATH db query "GRANT ALL PRIVILEGES ON $1.* To '$1'@'localhost' IDENTIFIED BY '$WPDBPASS';"
rm $ROOTPATH"wp-config.php"
wp --path=$ROOTPATH core config --dbname=$1 --dbuser=$1 --dbpass=$WPDBPASS
wp --path=$ROOTPATH core install --url=$URL --title=$1 --admin_user=$1 --admin_password=$WPPASS --admin_email=$1@ictgateshead.org
cp htaccess-standard $ROOTPATH".htaccess"


wp --path=$ROOTPATH core multisite-convert 
cp htaccess-subfolder $ROOTPATH".htaccess"

echo ".htaccess re-write rules created"

if [ -d $ROOTPATH"wp-config-sample.php" ]; then
  rm $ROOTPATH"wp-config-sample.php"
fi

echo "Done. Visit $URL"

fi
