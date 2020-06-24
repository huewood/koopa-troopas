# This script installs php7.2 and related packages to a Linux server - developed was ALAS in mind
# The successful output of the script enables the user to change the PHP version using the 'alternatives' method
# This method allows the server to quickly change between PHP versions - removing the need to uninstall older PHP packages or to revert changes

#!/bin/bash

echo "==============================="
echo "Installing PHP 7.2"
echo "==============================="
sudo yum install php72

echo "==============================="
echo "Installing PHP 7.2 modules"
echo "==============================="
sudo yum install php72-gd
sudo yum install php72-cli
sudo yum install php72-commonl
sudo yum install php72-json
sudo yum install php72-pdo
sudo yum install php72-process
sudo yum install php72-xml
sudo yum install php72-imap
sudo yum install php72-mbstring
sudo yum install php72-mysqlnd
sudo yum install php72-opcache
sudo yum install php72-pecl-apcu
sudo yum install php72-pecl-memcached.x86_64
sudo yum install patch

echo "==============================="
echo "Sym-linking PHP 7.2"
echo "==============================="
sudo ln -sf /etc/httpd/conf.d/php-conf.7.2 /etc/alternatives/php.conf
sudo ln -sf /etc/httpd/conf.modules.d/15-php-conf.7.2 /etc/alternatives/10-php.conf

echo "==============================="
echo "Choose PHP 7 as an Alternative"
echo "==============================="
sudo alternatives --config php