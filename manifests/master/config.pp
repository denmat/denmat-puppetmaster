class puppetmaster::master::config {
  include puppetmaster::params

  file { '/etc/puppet':
    ensure  => directory,
    owner   => $puppetmaster_deploy_user,
    group   => root,
    mode    => '0755',
    require => Package['puppet']
  }

  file { '/etc/puppet/environments':
    ensure  => directory,
    owner   => $puppetmaster_deploy_user,
    group   => root,
    mode    => '0755',
    require => File['/etc/puppet/puppet.conf']
  }

  file { '/etc/puppet/hiera.yaml':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template('puppetmaster/master/hiera.yaml.erb'),
   }

  file { '/etc/puppet/auth.conf':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => 'puppet:///modules/puppetmaster/auth.conf',
  }

  if $use_eyaml {
    include puppetmaster::master::eyaml
  }

  if $use_r10k {
    include puppetmaster::master::r10k
  }

}
