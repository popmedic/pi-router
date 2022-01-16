sudo systemctl disable dhcpcd
sudo apt-get update -y
sudo apt-get install isc-dhcp-server -y
sudo systemctl disable isc-dhcp-server
sudo mv /etc/dhcp /etc/dhcp.backup
sudo mv /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.backup
sudo mv /etc/default/isc-dhcp-server6 /etc/default/isc-dhcp-server6.backup
sudo mv /etc/init.d/isc-dhcp-server /etc/init.d/isc-dhcp-server.backup
sudo mv /etc/init.d/isc-dhcp-server6 /etc/init.d/isc-dhcp-server6.backup
sudo cp -r etc/dhcp /etc/
sudo cp default/isc-dhcp-server /etc/default/isc-dhcp-server
sudo cp default/isc-dhcp-server6 /etc/default/isc-dhcp-server6
sudo cp etc/init.d/isc-dhcp-server /etc/init.d/isc-dhcp-server
sudo cp etc/init.d/isc-dhcp-server6 /etc/init.d/isc-dhcp-server6
