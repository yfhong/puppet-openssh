# == Class openssh::params
#
# This class is meant to be called from openssh.
# It sets variables according to platform.
#
class openssh::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'openssh'
      $service_name = 'openssh'
    }
    'RedHat', 'Amazon': {
      $package_name = 'openssh'
      $service_name = 'openssh'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
