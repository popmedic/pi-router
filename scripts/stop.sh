# stop
sudo service radvd stop
sudo service isc-dhcp-server6 stop
sudo service isc-dhcp-server stop
sudo cmd=D sh scripts/iptables.sh
sudo ifdown --force wlan0
sudo ifdown --force eth0
