define php70::modules (
  $ensure = $::php70::params::php_package_ensure
) {
  include ::php70

  $required = $title

  package { "php70-${required}":
    ensure  => $ensure,
    require => Package[$::php70::params::php_packages],
  } ~> Exec['php-apachectl-restart']

}
