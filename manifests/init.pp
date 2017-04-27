# Class: php70
#
# This class installs PHP 7.0 for Amazon AMI
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to install
#
# Actions:
#   - Install PHP 7.0
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'php70': }
#
class php70 (
  $ensure = $::php70::params::php_package_ensure
) inherits ::php70::params {
  package { $::php70::params::php_packages:
    ensure  => $ensure
  }

  $config = hiera_hash('php',{})
  create_resources('php70::config',$config)

  $modules = hiera_hash('php::modules',{})
  create_resources('php70::modules',$modules)

  $raw = hiera_hash('php::raw',{})
  create_resources('php70::raw',$raw)

  exec { 'php-apachectl-restart':
    command     => '/usr/sbin/apachectl restart',
    onlyif      => '/usr/bin/test -x /usr/sbin/apachectl',
    refreshonly => true
  }

}
