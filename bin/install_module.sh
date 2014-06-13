#!/bin/sh
puppet module build .
sudo puppet module install ./pkg/niyue-l2tpvpn-0.1.0.tar.gz --force --target-dir /usr/share/puppet/modules
