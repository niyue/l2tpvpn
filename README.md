l2tpvpn
========

l2tpvpn module is a puppet (http://puppetlabs.com/) module that can be used to deploy a L2TP VPN quickly in Ubuntu.

Currently, this module is only verified for:

* puppet v3.0.1 in Ubuntu 12.04 in Windows Azure cloud environment.
* puppet v2.7.25 in Amazon Linux 2014.03 in Amazon EC2 environment.

It is developed primarily to set up a VPN quickly to climb over the Great Fire Wall for personal use.

Usage
-------
1. Install Puppet
	* Ubuntu
		* Run "curl -L https://raw.githubusercontent.com/niyue/l2tpvpn/master/bin/install_deps.sh -O"
		* Run "bash install_deps.sh"  
  	* Amazon Linux
		* Run "curl -L https://raw.githubusercontent.com/niyue/l2tpvpn/master/bin/install_deps_amazon_linux.sh -O"
		* Run "bash install_deps.sh"
  	* Description
		* This script will install puppet 3.0 or later just like an automated version of http://docs.puppetlabs.com/guides/puppetlabs_package_repositories.html#for-debian-and-ubuntu
		* git will be installed as well
		* the l2tpvpn puppet module in Github will be installed
2. Modify username/password
	* cd l2tpvpn
	* Modify the username/password in tests/init.pp by changing the key/value pair for 'credentials' hash
	* change 'shared_key' and credentials to anything you like, and you will use them in step #5 when setting up your VPN client

3. Install and apply puppet module
	* run "sudo bash ./bin/apply_puppet.sh"

4. Open UDP ports
	* If the server is hosted behind a fire wall, please ensure UDP ports 500 and 4500 are open to allow clients to connect.

5. That's it
	* Now you can connect your iOS/Android client to the L2TP VPN server via the credentials specified above

License
-------
http://www.apache.org/licenses/LICENSE-2.0.html

Contact
-------
Ni Yue (niyue.com AT gmai1 d0t c0m)

Support
-------

Just drop me an email.
