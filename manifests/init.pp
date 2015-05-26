# == Class: openssh
#
# Full description of class openssh here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class openssh (
  $package_name       = $::openssh::params::package_name,
  $package_ensure     = $::openssh::params::package_ensure,
  $service_name       = $::openssh::params::service_name,
  $service_ensure     = $::openssh::params::service_ensure,
  $server_config_file = $::openssh::params::server_config_file,
  $ssh_known_hosts    = $::openssh::params::ssh_known_hosts,
  $server_config,
) inherits ::openssh::params {

  # validate parameters here

  class { '::openssh::install': } ->
  class { '::openssh::config': } ~>
  class { '::openssh::service': } ->
  Class['::openssh']
}
