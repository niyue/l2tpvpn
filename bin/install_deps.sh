#!/bin/sh
echo "The following script will install puppet, git via apt-get, and clone l2tpvpn module from Github, and you have to enter an admin user's password to do this"
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get update
sudo apt-get install puppet
sudo apt-get install git
git clone https://github.com/niyue/l2tpvpn.git
echo "***************************************"
if [ -d "./l2tpvpn" ]; then
	echo "Puppet and git are successfully installed, and l2tpvpn puppet module is successfully cloned from Github. Please modify 'shared_key', 'credentials' in l2tpvpn/tests/init.pp. You can set 'shared_key' to any value you like and VPN username/password in 'credentials' table"
else
	echo "Something went wrong. It is possible puppet/git is not successuflly installed due to network problem. Please check the installation log above for details."
fi
