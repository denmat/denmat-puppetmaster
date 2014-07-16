class puppetmaster::config {

  $is_puppetmaster_enabled = hiera('puppetmaster::is_enabled')
  $is_ca = hiera('puppetmaster::is_ca', false)
  $dns_alt_names = hiera('puppetmaster::dns_alt_names')
  $use_dns_srv_domain = hiera('use_dns_srv_domain', false)
  $puppetdb_server = hiera('puppetdb_server')
  $puppetdb_port = hiera('puppetdb_port', '8081')
  $use_environments = hiera('puppetmaster::use_environments')
  $puppet_deploy_user = hiera('puppetmaster::deploy_user', 'root')
  $use_r10k = hiera('puppetmaster::use_r10k', false)
  $use_eyaml = hiera('puppetmaster::use_eyaml', false)
  $puppetdb_server = hiera('puppetdb_server')
  $puppetdb_port = hiera('puppetdb_port', '8081')


  file { '/etc/puppet':
    ensure  => directory,
    owner   => $puppet_deploy_user,
    group   => root,
    mode    => '0755',
    require => Package['puppet']
  }

  file { '/etc/puppet/environments':
    ensure  => directory,
    owner   => $puppet_deploy_user,
    group   => root,
    mode    => '0755',
    require => File['/etc/puppet/puppet.conf']
  }

  file { '/etc/puppet/hiera.yaml':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => 'puppet:///modules/puppetmaster/hiera.yaml',
   }

  file { '/etc/puppet/auth.conf':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => 'puppet:///modules/puppetmaster/auth.conf',
  }

  if $use_eyaml {
    include puppetmaster::eyaml
  }

  if $use_r10k {
    include puppetmaster::r10k
  }

}
