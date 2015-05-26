# == Class openssh::params
#
# This class is meant to be called from openssh.
# It sets variables according to platform.
#
class openssh::params {

  # default package name and ensured status.
  $package_name = ['openssh-server']
  $package_ensure = 'present'

  # default service setting.
  $service_name = $::operatingsystem ? {
    /(Debian|Ubuntu)/ => 'ssh',
    default           => 'sshd',
  }
  $service_ensure = 'running'

  ## global parameters
  $root_group = $::operatingsystem ? {
    /(FreeBSD|Solaris)/ => 'wheel',
    default             => 'root',
  }

  # default base config directory and file
  $confdir = '/etc/ssh'

  $server_config_file = "${confdir}/sshd_config"
  $client_config_file = "${confdir}/ssh_config"
  $ssh_known_hosts = "${confdir}/ssh_known_hosts"

  case $::operatingsystem {
    'Debian', 'Ubuntu',
    'RedHat', 'CentOS',
    'Amazon': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
