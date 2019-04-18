##################################################################
#!/bin/bash

# update the sources
sudo apt update
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::updated apt repos"
sleep 2

# install nginx
sudo apt  install -y nginx
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::installed NGINX"
sleep 2

# install mysql
sudo apt -y install mysql-server
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::installed mysql-server"
sleep 2

# do a secure mysql installation
sudo mysql_secure_installation <<EOF
password
n
y
y
y
y
y
EOF

echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::mysql secure installed 1/2"
sleep 2


#add php repos
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::adding PHP"
sleep 2

#install php
sudo apt install -y php7.1-fpm php7.1-mcrypt php7.1-cli php7.1-xml php7.1-mysql php7.1-gd php7.1-imagick php7.1-recode php7.1-tidy php7.1-xmlrpc php7.1-mbstring php7.1-curl php7.1-gettext php7.1-token-stream
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::installing PHP"

#add firewall rules
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx HHTP'
sudo ufw enable
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::enable firewall"


# install redis
sudo apt install -y redis-server
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::installed redis"
sleep 2


#install memcached
sudo apt install -y memcached
sudo apt install -y php-memcached
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::installed memcached"
sleep 2


#installing supervisor
apt install -y supervisor
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::installed supervisor"
sleep 2

# restart php to apply changes
sudo systemctl restart php7.1-fpm
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::restarted PHP"
sleep 2


# restart nginx
sudo service nginx restart
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::restarted NGINX"
sleep 2

#install composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::installed composer"
sleep 2



# install laravel installer
composer global require laravel/installer
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::installed laravel installer"
sleep 2

# clean unnecesary files from apt-get
sudo apt-get clean
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::cleaned apt-files"
sleep 2

echo ":::::::::::::::::::::::::::: INSTALLATION COMPLETED! ::::::::::::::::::::::::::::::::"