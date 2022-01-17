# start
echo -e "\e[33m### ALLOW PORT FORWARDING ###\e[0m"
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
echo -e "\e[33m### SET-UP NETWORK INTERFACES ###\e[0m"
sudo ifup --force eth0
sudo ifup --force wlan0
echo -e "\e[33m### FORWARD THE TRAFFIC ON INTERFACES ###\e[0m"
sudo sh scripts/iptables.sh
echo -e "\e[33m### START-UP DHCP/DHCP6 ###\e[0m"
sudo service isc-dhcp-server start
sudo service isc-dhcp-server6 start
echo -e "\e[33m### START-UP ROUTER ADVERTISEMENTS ###\e[0m"
sudo service radvd start
echo -e "\e[33m### START-UP HOST ACCESS POINT ###\e[0m"
sudo hostapd /etc/hostapd/hostapd.conf
