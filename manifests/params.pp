class puppetmaster::params {

  $puppet_client_packages =  hiera('puppet::client::packages')
  $use_dns_srv_domain = hiera('use_dns_srv_domain', false)
  $preferred_puppet_master = hiera('preferred_puppet_master', false)
  $preferred_puppet_environment = hiera('preferred_puppet_environment', 'production' )

  $is_puppetmaster = hiera('puppetmaster::is_puppetmaster', false)
  $is_ca = hiera('puppetmaster::is_ca', false)
  $is_devel = hiera('puppetmaster::is_devel', false)
  $use_directory_environments = hiera('puppetmaster::use_directory_environments', false)
  $puppetmaster_modulepath = hiera('puppetmaster::modulepath', false)
  $dns_alt_name = hiera('puppetmaster::dns_alt_names', false)
  $puppet_report_server = hiera('puppetmaster::report_server', 'puppet')
  $puppetmaster::use_httpd = hiera('puppetmaster::use_httpd', false)

  $puppetmaster_deploy_user = hiera('puppetmaster::deploy_user', 'root')
  $use_r10k = hiera('puppetmaster::use_r10k', false)
  $use_eyaml = hiera('puppetmaster::use_eyaml', false)
  $puppetdb_server = hiera('puppetmaster::puppetdb_server', 'puppetdb')
  $puppetdb_port = hiera('puppetmaster::puppetdb_port', '8081')

  $use_hiera = hiera('puppetmaster::use_hiera', false)
  $hiera_backend = hiera('puppetmaster::hiera::backends', false)
  $hiera_hierarchy = hiera('puppetmaster::hiera::hierarchy', false)
}
