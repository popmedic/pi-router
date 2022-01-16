sudo systemctl disable dhcpcd
sudo apt-get update -y
sudo apt-get install isc-dhcp-server -y
sudo systemctl disable isc-dhcp-server
sudo mv /etc/dhcp /etc/dhcp.backup
sudo mv /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.backup
sudo mv /etc/default/isc-dhcp-server6 /etc/default/isc-dhcp-server6.backup
sudo cp -r etc/dhcp /etc/
sudo cp default/isc-dhcp-server /etc/default/isc-dhcp-server
sudo cp default/isc-dhcp-server6 /etc/default/isc-dhcp-server6
