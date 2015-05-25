# == Class openssh::config
#
# This class is called from openssh for service config.
#
class openssh::config {
  file { 'openssh_server_config':
    path    => $::openssh::server_config_file,
    ensure  => 'present',
    owner   => root,
    group   => $::openssh::params::root_group,
    mode    => '0640',
    content => template('openssh/sshd_config.erb'),
  }
}
