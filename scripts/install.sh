echo "\e[33m### REMOVE RFKILL BLOCK ###\e[0m"
sudo rfkill unblock wifi

echo "\e[33m### INSTALL IPTABLES ###\e[0m"
sudo apt-get update -y
sudo apt-get install iptables -y

echo "\e[33m### INSTALLING HOSTAPD ###\e[0m"
sudo apt-get update -y
sudo apt-get install hostapd -y
echo "\e[33m### DISABLE HOSTAPD ###\e[0m"
sudo systemctl disable hostapd
echo "\e[33m### CONFIGURE HOSTAPD ###\e[0m"
sudo cp -r /etc/hostapd /etc/hostapd.backup
sudo cp -r /etc/default/hostapd /etc/default/hostapd.backup
sudo cp -rf etc/hostapd /etc/
sudo cp etc/default/hostapd /etc/default/hostapd

echo "\e[33m### INSTALL OUR INTERFACES ###\e[0m"
sudo ifdown --force wlan0
sudo ifdown --force eth0
sudo mv /etc/network/interfaces /etc/network/interfaces.backup
sudo cp -f etc/network/interfaces /etc/network/

echo "\e[33m### DISABLE DEFAULT DHCPCD ###\e[0m"
sudo systemctl disable dhcpcd

echo "\e[33m### INSTALL ISC-DHCP-SERVER ###\e[0m"
sudo apt-get update -y
sudo apt-get install isc-dhcp-server -y
echo "\e[33m### DISABLE ISC-DHCP-SERVER ###\e[0m"
sudo systemctl disable isc-dhcp-server
echo "\e[33m### CONFIGURE ISC-DHCP-SERVER ###\e[0m"
sudo mv /etc/dhcp /etc/dhcp.backup
sudo mv /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.backup
sudo mv /etc/default/isc-dhcp-server6 /etc/default/isc-dhcp-server6.backup
sudo mv /etc/init.d/isc-dhcp-server /etc/init.d/isc-dhcp-server.backup
sudo mv /etc/init.d/isc-dhcp-server6 /etc/init.d/isc-dhcp-server6.backup
sudo cp -r etc/dhcp /etc/
sudo cp etc/default/isc-dhcp-server /etc/default/isc-dhcp-server
sudo cp etc/default/isc-dhcp-server6 /etc/default/isc-dhcp-server6
sudo cp etc/init.d/isc-dhcp-server /etc/init.d/isc-dhcp-server
sudo cp etc/init.d/isc-dhcp-server6 /etc/init.d/isc-dhcp-server6

echo "\e[33m### INSTALL RADVD ###\e[0m"
sudo apt-get update -y
sudo apt-get install radvd -y
echo "\e[33m### DISABLE RADVD ###\e[0m"
sudo systemctl disable radvd
echo "\e[33m### CONFIGURE RADVD ###\e[0m"
sudo mv /etc/radvd.conf /etc/radvd.conf.backup
sudo cp etc/radvd.conf /etc/radvd.conf

echo "\e[33m### INSTALLING APACHE ###\e[0m"
sudo apt-get update -y
sudo apt-get install apache2 -y
echo "\e[33m### STOP APACHE ###\e[0m"
sudo systemctl stop apache2
echo "\e[33m### BACKUP APACHE CONFIGURATION ###\e[0m"
sudo mv /etc/apache2 /etc/apache2.backup
echo "\e[33m### COPY NEW APACHE CONFIGURATION ###\e[0m"
sudo cp -r etc/apache2 /etc/
echo "\e[33m### GENERATING SELF-SIGNED CERT ###\e[0m"
sudo openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -subj "/C=US/ST=Colorado/L=Denver/O=IT/CN=pirouter.net" \
    -keyout /etc/ssl/private/apache-selfsigned.key \
    -out /etc/ssl/certs/apache-selfsigned.crt
echo "\e[33m### START APACHE BACK UP ###\e[0m"
sudo systemctl start apache2

echo "\e[33m### INSTALLING PHP ###\e[0m"
sudo apt-get install php -y

echo "\e[33m### COPYING PHP PROJECT ###\e[0m"
sudo cp -r var/www/html /var/www/
sudo chmod 777 /var/www/html/speedboost/validate.json
echo "\e[33m### ALLOW APACHE REWRITE ###\e[0m"
sudo a2enmod rewrite
echo "\e[33m### RESTART APACHE ###\e[0m"
sudo systemctl restart apache2

echo "\e[33m### COMPLETE ###\e[0m"
echo "\e[33m### TO START - 'sh scripts/start.sh' ###\e[0m"
