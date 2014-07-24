class puppetmaster::master::config {

  include puppetmaster::params

  $use_hiera = $puppetmaster::params::use_hiera
  $hiera_backend = $puppetmaster::params::hiera_backend
  $hiera_hierarchy = $puppetmaster::params::hiera_hierarchy

  if $use_httpd {
    $puppet_service = 'httpd'
  } else {
    $puppet_service = 'puppetmaster'
  }

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
    require => File['/etc/puppet/puppet.conf'],
    notify  => Service[$puppet_service]
  }

  file { '/etc/puppet/hiera.yaml':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template('puppetmaster/master/hiera.yaml.erb'),
    notify  => Service[$puppet_service]
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
