#!/bin/bash

# Update and upgrade the system
sudo apt update
sudo apt upgrade -y

# Install LAMP stack components
sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql

# Clone the PHP application from GitHub
git clone https://github.com/laravel/laravel /var/www/html

# Configure Apache
sudo chown -R www-data:www-data /var/www/html
sudo a2enmod rewrite
sudo systemctl restart apache2

# Configure MySQL
sudo mysql_secure_installation

# Restart MySQL
sudo systemctl restart mysql

