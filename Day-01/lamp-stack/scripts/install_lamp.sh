#!/bin/bash
set -e

# Install Apache, MySQL, PHP
sudo yum update -y
sudo yum install -y httpd mariadb-server php php-mysqlnd

# Start and enable services
sudo systemctl start httpd
sudo systemctl enable httpd

sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MySQL Installation (skipping user interaction for automation)
sudo mysql -e "UPDATE mysql.user SET Password=PASSWORD('rootpass') WHERE User='root';"
sudo mysql -e "DELETE FROM mysql.user WHERE User='';"
sudo mysql -e "DROP DATABASE test;"
sudo mysql -e "FLUSH PRIVILEGES;"

# Add PHP test file
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

# Firewall (if using Amazon Linux 2 and firewalld is running)
if systemctl is-active --quiet firewalld; then
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --permanent --add-service=https
    sudo firewall-cmd --reload
fi
