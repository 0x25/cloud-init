#!/bin/bash
###################
#install wordpress#
###################
# test on ubuntu 25 09 2015
# en CLI dans la VM / pas en user-data


echo "--- START INSTALL WORDPRESS ---"

#variables
nom_admin=admin
pass_admin=password
url=http://fr.wordpress.org/latest-fr_FR.zip
work=/tmp
sudo su

cd $work

#update/upgrade
apt-get update -y --force-yes
apt-get upgrade -y --force-yes

#applications
apt-get install -q -y --force-yes apache2 mysql-server php5 php5-mysql libapache2-mod-php5 php5-gd php5-curl libssh2-php unzip wget

#requetes SQL
echo "CREATE DATABASE wordpress; CREATE USER $nom_admin; SET PASSWORD FOR $nom_admin = PASSWORD('$pass_admin'); GRANT ALL PRIVILEGES ON wordpress.* TO $nom_admin@localhost IDENTIFIED BY '$pass_admin';FLUSH PRIVILEGES; exit; " > wordpress.sql
mysql -h localhost -u root <  wordpress.sql

a2enmod rewrite

wget -O wp.zip $url
unzip -o wp.zip

rm -rf /var/www/html/*
cp -r wordpress/* /var/www/html/
chown -R www-data /var/www/html

service apache2 restart

echo "--- FIN INSTALLATION WORDPRESS ---"
