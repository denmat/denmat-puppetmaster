class puppetmaster::master::service (
  $ensure  = true,
  $enabled = true,
  ) {

  include puppetmaster::params

  if $puppetmaster::params::use_httpd {
    service { 'httpd':
      ensure     => $ensure,
      enable     => $enabled,
      hasrestart => true,
      require    => Package['httpd']
    }
  
    Package<| tag == 'pm_httpd_packages' |> -> Service['httpd']
  } else {
    service { 'puppetmaster': 
      ensure     => $ensure,
      enable     => $enabled,
    }
  }
}
