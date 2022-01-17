echo -e "\e[33m### INSTALL RADVD ###\e[0m"
sudo apt-get update -y
sudo apt-get install radvd -y
echo -e "\e[33m### DISABLE RADVD ###\e[0m"
sudo systemctl disable radvd
echo -e "\e[33m### CONFIGURE RADVD ###\e[0m"
sudo mv /etc/radvd.conf /etc/radvd.conf.backup
sudo cp etc/radvd.conf /etc/radvd.conf
