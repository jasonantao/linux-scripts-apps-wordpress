#Setup File PLACEHOLDER

mysql -u root

create database mywebsite;
grant usage on *.* to admin@localhost identified by 'password';
grant all privileges on mywebsite.* to admin@localhost;

use mywebsite;
exit;
