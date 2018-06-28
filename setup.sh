#Setup File PLACEHOLDER
echo "WordPress has now succesfully been installed and a database created."

#mysql -u root

mysql create database mywebsite
mysql grant usage on *.* to admin@localhost identified by 'password';
mysql grant all privileges on mywebsite.* to admin@localhost;

mysql use mywebsite;
mysql exit;
echo "WordPress has now succesfully been installed and a database created."
