# This script installs a basic LAMP stack on a virtual machine - developed with CentOS in mind 
# The script successfully ends with the output of installed LAMP services versions

#!/bin/bash

set -e

echo "==============================="
echo "Enabling repositories."
echo "==============================="

rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm


echo "==============================="
echo "Installing Apache service."
echo "==============================="
yum --enablerepo=epel,remi install httpd -y

echo "==============================="
echo "Configuring Apache service."
echo "==============================="
systemctl enable httpd.service
systemctl start httpd.service

echo "==============================="
echo "Installing MySQL service."
echo "==============================="
rpm -Uvh  https://repo.mysql.com/mysql80-community-release-el7-1.noarch.rpm
yum install mysql-server -y

echo "==============================="
echo "Configuring MySQL service."
echo "==============================="
systemctl enable mysqld.service
systemctl start mysqld.service

mysql=`grep 'A temporary password' /var/log/mysqld.log  | tail -n1`
echo "Temporary password for MySQL is:"
echo "$mysql"

mysql_secure_installation
echo "==============================="
echo "Installing PHP service."
echo "==============================="
yum --enablerepo=epel,remi-php73 install php -y
yum --enablerepo=remi-php73 list php-*
yum --enablerepo=remi-php73 install php-mysql php-xml php-xmlrpc php-soap php-gd -y

echo "==============================="
echo "Configuring MySQL service."
echo "==============================="
systemctl restart httpd.service

echo "==============================="
echo "Installing git"
echo "==============================="
sudo yum install git

echo "==============================="
echo "Verifying all installed."
echo "==============================="
php -v 
httpd -v
mysql -v
git --version