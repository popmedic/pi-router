cmd=${cmd:-A}
shared=${shared:-eth0}
router=${router:-wlan0}

sudo iptables -t nat -$cmd POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -$cmd FORWARD -i $router -o $shared -j ACCEPT
sudo iptables -$cmd FORWARD -i $shared -o $router -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo ip6tables -t nat -$cmd POSTROUTING -o eth0 -j MASQUERADE
sudo ip6tables -$cmd FORWARD -i $router -o $shared -j ACCEPT
sudo ip6tables -$cmd FORWARD -i $shared -o $router -m state --state RELATED,ESTABLISHED -j ACCEPT
