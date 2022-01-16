sudo apt-get update -y
sudo apt-get install radvd -y
sudo systemctl disable radvd
sudo mv /etc/radvd.conf /etc/radvd.conf.backup
sudo cp etc/radvd.conf /etc/radvd.conf
