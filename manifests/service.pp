# == Class openssh::service
#
# This class is meant to be called from openssh.
# It ensure the service is running.
#
class openssh::service {

  service { $::openssh::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
