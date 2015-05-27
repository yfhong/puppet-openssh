# == Class openssh::config
#
# This class is called from openssh for service config.
#
class openssh::config {
  $server_config = hiera_hash('openssh::server_config')

  $::openssh::server_config.each |$key, $value| {
    file_line { $key:
      ensure => 'present',
      path   => $::openssh::server_config_file,
      line   => "${key} ${value}",
      match  => "^#?${key}.*",
    }
  }
}
