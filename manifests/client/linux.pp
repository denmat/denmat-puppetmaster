class puppetmaster::client::linux inherits puppetmaster::params {

  create_resources(package, $puppet_client_packages)

  file {'/etc/puppet/puppet.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('puppetmaster/puppet.conf.erb'),
    notify  => Service['puppet']
  }

  file {'/etc/sysconfig/puppet':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('puppetmaster/puppet_defaults.erb'),
  }

  service {'puppet':
    enable => true,
  }

}
