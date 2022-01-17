echo -e "\e[33m### INSTALLING APACHE ###\e[0m"
sudo apt-get update -y
sudo apt-get install apache2 -y
echo -e "\e[33m### STOP APACHE ###\e[0m"
sudo systemctl stop apache2
echo -e "\e[33m### BACKUP APACHE CONFIGURATION ###\e[0m"
sudo mv /etc/apache2 /etc/apache2.backup
echo -e "\e[33m### COPY NEW APACHE CONFIGURATION ###\e[0m"
sudo cp -r etc/apache2 /etc/
echo -e "\e[33m### GENERATING SELF-SIGNED CERT ###\e[0m"
sudo openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -subj "/C=US/ST=Colorado/L=Denver/O=IT/CN=pirouter.net" \
    -keyout /etc/ssl/private/apache-selfsigned.key \
    -out /etc/ssl/certs/apache-selfsigned.crt
echo -e "\e[33m### START APACHE BACK UP ###\e[0m"
sudo systemctl start apache2
echo -e "\e[33m### INSTALLING PHP ###\e[0m"
sudo apt-get install php -y
echo -e "\e[33m### RESTART APACHE ###\e[0m"
sudo systemctl restart apache2
