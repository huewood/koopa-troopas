# This script installs PHP memcached service on a Linux VM - developed with CentOS in mind
# A monitor service is also installed to verify memcached is functioning correctly - additional configuration with web-app required
 
#!/bin/bash

set -e

echo "==============================="
echo "Installing Memcached service"
echo "==============================="
sudo yum install memcached

echo "==============================="
echo "Memcached installed."
echo "To view info, use `memcached -h`."
echo "Configuring to Start on Boot."
echo "==============================="
sleep 2s

systemctl enable memcached
echo "==============================="
echo "Installing Memcached PHP module"
echo "==============================="
sudo yum install php-pecl-memcached.x86_64
sudo apachectl restart

sleep 2s

echo "==============================="
echo "Installing memcache monitor"
echo "==============================="
sudo yum install nmap-ncat.x86_64

echo "==============================="
echo "Services all installed."
echo "Make sure to configure and the restart the memcache service as well as web configuration."
echo "==============================="