echo -e "\e[33m### DISABLE DEFAULT DHCPCD ###\e[0m"
sudo systemctl disable dhcpcd
echo -e "\e[33m### INSTALL ISC-DHCP-SERVER ###\e[0m"
sudo apt-get update -y
sudo apt-get install isc-dhcp-server -y
echo -e "\e[33m### DISABLE ISC-DHCP-SERVER ###\e[0m"
sudo systemctl disable isc-dhcp-server
echo -e "\e[33m### CONFIGURE ISC-DHCP-SERVER ###\e[0m"
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
