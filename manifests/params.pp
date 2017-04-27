# Class: php70::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other operatingsysem patterns - amazon ami only
#
class php70::params {
  $php_package_ensure = 'latest'

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        Amazon: {
          case $::operatingsystemmajrelease {
            default: {
              $php_packages = [
                'php70',
                'php70-bcmath',
                'php70-cli',
                'php70-common',
                'php70-dba',
                'php70-devel',
                'php70-gd',
                'php70-intl',
                'php70-json',
                'php70-ldap',
                'php70-mbstring',
                'php70-mcrypt',
                'php70-mysqlnd',
                'php70-pdo',
                'php70-process',
                'php70-xml'
              ]
            }
          }
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} based system.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
