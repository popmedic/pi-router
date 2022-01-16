sudo apt-get install apache2 -y
sudo systemctl stop apache2
sudo mv /etc/apache2 /etc/apache2.backup
sudo cp -r etc/apache2 /etc/
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
sudo systemctl start apache2
sudo apt-get install php -y
sudo systemctl restart apache2
