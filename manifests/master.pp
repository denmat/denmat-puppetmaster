class puppetmaster::master {

  class { 'puppetmaster::master::install': } ->
  class { 'puppetmaster::master::config': } -> 
  class { 'puppetmaster::master::service': }
  
}