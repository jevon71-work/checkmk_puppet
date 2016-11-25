$check_mk_deps = ['time', 'libsnmp-python', 'traceroute', 'apache2', 'dnsutils', 'graphviz', 'rsync', 'unzip', 'snmp', 'php-cli', 'php-cgi']
$check_mk_package = $facts['os:distro:description'] ? {
  'Ubuntu 14.04.5 LTS' => 'check-mk-raw-1.2.8p14_0.trusty_amd64.deb',
  'Ubuntu 16.04.1 LTS' => 'check-mk-raw-1.2.8p14_0.xenial_amd64.deb',
  default  => ['WhatWereYouThinking?ThisCannotRunOnThisOS'],
}

Package {ensure => 'latest'}

package {$check_mk_deps:}

file { '/var/staging':
  ensure => directory,
  mode   => '0755',
  owner  => 'vagrant',
  group  => 'vagrant',
}

class { 'staging':
  path  => '/var/staging',
  owner => 'vagrant',
  group => 'vagrant',
}

staging::file { $check_mk_package:
  source      => "https://mathias-kettner.de/support/1.2.8p14/${check_mk_package}",
}

#package { 'check-mk-raw-1.2.8p14_0.xenial_amd64.deb':
#  ensure   => present,
#  provider => dpkg,
#  source   => '/var/staging/check-mk-raw-1.2.8p14_0.xenial_amd64.deb',
#  require  => Staging::File['check-mk-raw-1.2.8p14_0.xenial_amd64.deb'],
#}
