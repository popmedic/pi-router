echo -e "\e[33m### REMOVE RFKILL BLOCK ###\e[0m"
sudo rfkill unblock wifi
sudo sh scripts/hostapd.sh
sudo sh scripts/isc-server.sh
sudo sh scripts/radvd.sh
sudo sh scripts/apache.sh
echo -e "\e[33m### COMPLETE ###\e[0m"
echo -e "\e[33m### TO START - 'sudo sh scripts/start' ###\e[0m"
