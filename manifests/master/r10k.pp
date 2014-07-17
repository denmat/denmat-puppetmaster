class puppetmaster::master::r10k {

  $puppetmaster_deploy_user = hiera('puppetmaster::deploy_user', 'root')
  $r10k_packages = hiera('puppetmaster::r10k_packages')

  create_resources(package, $r10k_packages)

   file { '/etc/r10k.yaml':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => 'puppet:///modules/puppetmaster/r10k.yaml',
  }

  file { '/var/cache/r10k':
    ensure  => directory,
    owner   => $puppetmaster_deploy_user,
    group   => root,
    mode    => 0755,
    require => User[$puppetmaster_deploy_user]
  }
}