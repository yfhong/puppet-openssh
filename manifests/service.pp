# == Class openssh::service
#
# This class is meant to be called from openssh.
# It ensure the service is running.
#
class openssh::service {

  service { 'sshd':
    name       => $::openssh::service_name,
    ensure     => $::openssh::service_ensure,
    enable     => $::openssh::service_ensure ? {
      'running' => true,
      'stopped' => false,
    },
    hasstatus  => true,
    hasrestart => true,
  }
}
