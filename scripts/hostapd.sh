echo -e "\e[33m### INSTALLING HOSTAPD ###\e[0m"
sudo apt-get update -y
sudo apt-get install hostapd -y
echo -e "\e[33m### DISABLE HOSTAPD ###\e[0m"
sudo systemctl disable hostapd
echo -e "\e[33m### CONFIGURE HOSTAPD ###\e[0m"
sudo cp -r /etc/hostapd /etc/hostapd.backup
sudo cp -r /etc/default/hostapd /etc/default/hostapd.backup
sudo cp -rf etc/hostapd /etc/
sudo cp etc/default/hostapd /etc/default/hostapd
