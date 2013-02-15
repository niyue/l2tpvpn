bash ./bin/install_module.sh
sudo puppet apply /usr/share/puppet/modules/l2tpvpn/tests/init.pp
sudo service pppd-dns restart
sudo service xl2tpd restart
sudo service ipsec restart
