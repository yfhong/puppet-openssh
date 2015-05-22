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
  $package_name = $::openssh::params::package_name,
  $service_name = $::openssh::params::service_name,
) inherits ::openssh::params {

  # validate parameters here

  class { '::openssh::install': } ->
  class { '::openssh::config': } ~>
  class { '::openssh::service': } ->
  Class['::openssh']
}
