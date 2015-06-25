# == Class openssh::config
#
# This class is called from openssh for service config.
#
class openssh::config {
  $server_config = hiera_hash('openssh::server_config')

  file { 'openssh_server_config':
    path    => $::openssh::server_config_file,
    ensure  => 'present',
    owner   => root,
    group   => $::openssh::params::root_group,
    mode    => '0644',
    content => template('openssh/sshd_config.erb'),
  }
}
