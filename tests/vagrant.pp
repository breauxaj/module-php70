node default {
  include ::php70

  Yumrepo <| |> -> Package <| provider != 'rpm' |>

  file { '/var/www/html/index.php':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => '<?php phpinfo(); ?>',
    require => Package['httpd']
  }

  package { 'gcc': ensure => present }
  package { 'gcc-c++': ensure => present }
  package { 'Judy-devel': ensure => present }

  package { 'httpd': ensure => present }

  php70::config {
    'Date/date.timezone': value => 'America/New_York'
  }

  php70::modules { 'pecl-xdebug': }

  php70::pecl { 'memprof': require => Package['gcc','gcc-c++','Judy-devel'] }

  php70::raw { '15-xdebug':
    content => 'zend_extension = xdebug.so
xdebug.max_nesting_level = 150
xdebug.remote_enable = 1
xdebug.remote_port = 9001
xdebug.remote_host = 10.0.2.2
xdebug.idekey = PHPSTORM'
  }

  php70::raw { '25-memprof':
    content => 'extension=memprof.so'
  }

}
