class puppetmaster::service (
  $ensure  = true,
  $enabled = true,
  $puppetmaster::use_httpd = false
  ) {

  if $puppetmaster::use_httpd {
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
