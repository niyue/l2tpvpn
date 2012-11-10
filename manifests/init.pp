# == Class: l2tpvpn
#
# Deploy L2TP VPN to Ubuntu.
#
# === Parameters
#
# [*shared_key*]
#   A pre shared key used for VPN connection.
# [*credentials*]
#   A hash containing username/password pairs used for connection.
#
#
# === Examples
#
#  class { l2tpvpn:
#    shared_key => 'your-shared-key',
#     credentials => {'your-username' => 'your-password'},
#  }
#
# === Authors
#
# Ni Yue (niyue.com AT gmai1 d0t c0m)
#
# === Copyright
#
# http://www.apache.org/licenses/LICENSE-2.0.html
#
require 'facter/default_gateway'
require 'facter/nameserver'

class l2tpvpn ($shared_key, $credentials) {
  package { 'openswan':
    ensure => present,
  }

  package { 'xl2tpd':
    ensure => present,
  }

  package { 'ppp':
    ensure => present,
  }

  file { 'l2tp-psk.conf':
    path => '/etc/ipsec.d/l2tp-psk.conf',
    ensure => file,
    require => Package['openswan'],
    content => template('l2tpvpn/l2tp-psk.conf.erb'),
  }

  file { 'ipsec.conf':
    path => '/etc/ipsec.conf',
    ensure => file,
    require => Package['openswan'],
    content => template('l2tpvpn/ipsec.conf.erb'),
  }

  file { 'ipsec.secrets':
    path => '/etc/ipsec.secrets',
    ensure => file,
    require => Package['openswan'],
    content => template('l2tpvpn/ipsec.secrets.erb'),
  }

  file { 'xl2tpd.conf':
    path => '/etc/xl2tpd/xl2tpd.conf',
    ensure => file,
    require => Package['xl2tpd'],
    content => template('l2tpvpn/xl2tpd.conf.erb'),
  }

  file { 'options.xl2tpd':
    path => '/etc/ppp/options.xl2tpd',
    ensure => file,
    require => Package['xl2tpd'],
    content => template('l2tpvpn/options.xl2tpd.erb'),
  }

  file { 'chap-secrets':
    path => '/etc/ppp/chap-secrets',
    ensure => file,
    require => Package['openswan'],
    content => template('l2tpvpn/chap-secrets.erb'),
  }

  $configs = [File['ipsec.conf'], File['ipsec.secrets'], File['xl2tpd.conf'], File['options.xl2tpd'], File['chap-secrets']]

  service {'pppd-dns':
    status => restart,
    subscribe => $configs,
    require => Package['ppp'],
  }

  service {'xl2tpd':
    status => restart,
    subscribe => $configs,
    require => Package['xl2tpd'],
  }

  service {'ipsec':
    status => restart,
    subscribe => $configs,
    require => Package['openswan'],
  }
}
