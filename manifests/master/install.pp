class puppetmaster::master::install {

  $default_pre_req = { tag => 'pre_req' }
  $default = { tag => 'pm_post' }
  $required_packages = hiera('puppetmaster::required_packages')
  $packages = hiera('puppetmaster::packages')
  
  validate_hash($required_packages)
  validate_hash($packages)

  create_resources(package, $required_packages, $default_pre_req)
  create_resources(package, $packages, $default)

  Package<| tag == pre_req |> -> Package<| tag == pm_post |>
}
