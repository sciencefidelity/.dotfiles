#!/bin/bash

# Script to quickly set up server on Debian
# with Apahe2, Maria DB and PHP on Micro VM

sudo apt update
sudo apt upgrade

# Swap

sudo fallocate -l 1G /swapfile
ls -lh /swapfile

sudo mkswap /swapfile
sudo swapon /swapfile

sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

sudo sysctl vm.swappiness=10
sudo sysctl vm.vfs_cache_pressure=50

# Add link to file /etc/sysctl.conf
# vm.swappiness=10
# vm.vfs_cache_pressure=50

# Build server

sudo apt install -y apache2 apache2-utils
sudo systemctl start apache2
sudo systemctl enable apache2

sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
sudo ufw allow www
sudo ufw allow https
sudo ufw status

sudo chown www-data:www-data /var/www/html/ -R

sudo mv /etc/apache2/mods-available/mpm_prefork.conf.bak
# Add link to /etc/apache2/mods-available/mpm_prefork.conf

sudo a2dismod mpm_event
sudo a2enmod mpm_prefork

sudo systemctl restart apache2.service

# Install MariaDB

sudo apt install mariadb-server mariadb-client
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation

# Install PHP 7.4

sudo apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https
sudo wget https://packages.sury.org/php/apt.gpg
sudo apt-key add apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.list
 
sudo apt update

sudo apt -y install php7.4

php -v
php -m

sudo apt-get install php7.4-curl, php7.4-dom , php7.4-gd, php7.4-gettext, php7.4-gmagick, php7.4-imagick, php7.4-mbstring, php7.4-mysql, php7.4-SimpleXML, php7.4-ssh2, php7.4-xml, php7.4-zip

sudo mv /etc/php/7.4/apache2/php.ini /etc/php/7.4/apache2/php.ini.bak
# Add link to /etc/php/7.4/apache2/php.ini

# Get the dotfiles