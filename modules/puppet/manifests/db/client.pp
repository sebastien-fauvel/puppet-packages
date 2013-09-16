class puppet::db::client {

  include 'puppet::master'

  file {'/etc/puppet/puppetdb.conf':
    ensure => file,
    content => template('puppet/puppetdb.conf'),
    owner => '0',
    group => '0',
    mode => '0644',
    before => Package['puppetmaster'],
    notify => Service['puppetmaster'],
  }

  file {'/etc/puppet/conf.d/puppetdb':
    ensure => file,
    content => template('puppet/conf.d/puppetdb'),
    group => '0',
    owner => '0',
    mode => '0644',
    notify => Exec['/etc/puppet/puppet.conf'],
    before => Package['puppetmaster'],
  }

  package {'puppetdb-terminus':
    ensure => present,
  }
}
