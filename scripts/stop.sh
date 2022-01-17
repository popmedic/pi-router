# stop
echo "\e[33m### STOP ROUTER ADVERTISEMENTS ###\e[0m"
sudo service radvd stop
echo "\e[33m### STOP DHCP/DHCP6 ###\e[0m"
sudo service isc-dhcp-server6 stop
sudo service isc-dhcp-server stop
echo "\e[33m### REMOVE FORWARDING ###\e[0m"
sudo cmd=D sh scripts/iptables.sh
echo "\e[33m### TEARDOWN INTERFACES ###\e[0m"
sudo ifdown --force wlan0
sudo ifdown --force eth0
