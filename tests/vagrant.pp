node default {
  include ::php70

  Yumrepo <| |> -> Package <| provider != 'rpm' |>

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

  file { '/var/www/html/index.php':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => '<?php phpinfo(); ?>',
    require => Package['httpd24']
  }

  package { 'httpd24': ensure => present }

  php70::config {
    'Date/date.timezone': value => 'America/New_York'
  }

  php70::modules { 'xmlrpc': }

}
