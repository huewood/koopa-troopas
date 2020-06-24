# This script was developed as an automated method to perform the standard backup procedures performed during a manual deployment process
# Currently, this template only has SQL dump and compress /files directory into a archive file
# More functionality can be added as required - such as overriding bluegreen database with SQL dump

# Anything covered in [ ] needs to be changed with the relevant confidentals - ie. [host] = database host address

#!/bin/bash

set -e

echo "=================="
echo "Back-up commencing"
echo "=================="

sleep 2s

# Backup SQL file from Database

mysqldump -h [host] -u [database-user] -p[password] --single-transaction [database] > /home/[user]/data-backups/[project]-$(date +%Y-%m-%d).sql

echo "========================================"
echo "SQL file dumped. Commencing file backup."
echo "========================================"
sleep 2s

# Backup files 

tar -cvjf /home/[user]/file_backups/[project]-files-$(date +%Y-%m-%d).tar.bz2 /var/www/html/[file_path] -C /var/www/html/[file_path]

echo "==================="
echo "Back-up successful!"
echo "==================="