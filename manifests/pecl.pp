define php70::pecl (
  $ensure = $::php70::params::php_package_ensure
) {
  include ::php70

  $extension = $title

  package { $extension:
    ensure   => $ensure,
    provider => 'pecl',
    require  => Package[$::php70::params::php_packages],
  } ~> Exec['php-apachectl-restart']

}
