# start
sudo ifup --force eth0
sudo ifup --force wlan0
sudo sh scripts/iptables.sh
sudo service isc-dhcp-server start
sudo service isc-dhcp-server6 start
sudo service radvd start
sudo sh scripts/hostapd-start.sh
