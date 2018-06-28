#Setup File PLACEHOLDER

mysql -u root

mysql create database mywebsite;
mysql grant usage on *.* to admin@localhost identified by 'password';
mysql grant all privileges on mywebsite.* to admin@localhost;

mysql grant all privileges on mywebsite.* to admin@localhost;


mysql use mywebsite;
mysql exit;
