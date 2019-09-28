#Installing httpd and starting service.
echo 'Installing httpd web server'
yum install httpd -y
service httpd start

echo 'The transfered dbName is' $dbName
