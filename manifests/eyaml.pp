class puppetmaster::eyaml {

  $eyaml_packages = hiera('puppetmaster::eyaml_packages')

  create_resources(package, $eyaml_packages)

  file { '/etc/puppet/secrets':
    ensure => directory,
    owner  => puppet,
    group  => root,
    mode   => 0500,
  }

  file { '/etc/puppet/secrets/.gnupg':
    ensure => directory,
    owner  => puppet,
    group  => root,
    mode   => 0700,
  }
}