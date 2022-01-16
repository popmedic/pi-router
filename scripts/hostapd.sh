sudo apt-get update -y
sudo apt-get install hostapd -y
sudo systemctl disable hostapd
sudo mv /etc/hostapd /etc/hostapd.backup
sudo mv /etc/default/hostapd /etc/default/hostapd.backup
sudo cp -r etc/hostapd /etc/
sudo cp default/hostapd /etc/default/hostapd
