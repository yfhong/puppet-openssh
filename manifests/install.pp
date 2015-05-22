# == Class openssh::install
#
# This class is called from openssh for install.
#
class openssh::install {

  package { $::openssh::package_name:
    ensure => present,
  }
}
