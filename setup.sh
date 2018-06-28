#Setup File PLACEHOLDER

mysql -u root

create database website;
grant usage on *.* to admin@localhost identified by 'password';
grant all privileges on website.* to admin@localhost;

use website;
exit;
