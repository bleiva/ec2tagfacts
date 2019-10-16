# == Class: ec2tagfacts::params
#
# automatic parameter and settings for the ec2tagfacts class
#
# === Variables
#
# [*pippkg*]
#   Set in ec2tagfacts::params, this is the Python pip package name by OS 
#   family.
#
# [*awscli*]
#   Set in ec2tagfacts::params, this is the pip package name of awscli.
#
# [*rubyjsonpkg*]
#   Set in ec2tagfacts::params, this is the ruby-json package name.
#
# [*enable_epel*]
#   True/False - sets up EPEL on RHEL systems automatically.
#
# === Authors
#
# Bryan Andrews <bryanandrews@gmail.com>
#
# === Copyright
#
# Copyright 2015 Bryan Andrews, unless otherwise noted.
#
class ec2tagfacts::params {

  $aws_cli_ini_settings   = '/root/.aws/credentials'

  case $::operatingsystem {
    'CentOS': {
      case $::operatingsystemrelease {
        /^7.*/: {
          $pippkg       = 'python-pip'
          $rubyjsonpkg  = 'rubygem-json'
          $awscli       = 'awscli'
          $enable_epel  = true
        }
        default: {
          $pippkg       = 'python-pip'
          $rubyjsonpkg  = 'ruby-json'
          $awscli       = 'awscli'
          $enable_epel  = true
        }
      }
    }
    'RedHat': {
      case $::operatingsystemrelease {
        /^7.*/: {
          $pippkg       = 'python-pip'
          $rubyjsonpkg  = 'rubygem-json'
          $awscli       = 'awscli'
          $enable_epel  = true
        }
        default: {
          $pippkg       = 'python-pip'
          $rubyjsonpkg  = 'ruby-json'
          $awscli       = 'awscli'
          $enable_epel  = true
        }
      }
    }
    'Fedora', 'Scientific', 'SLC', 'Ascendos', 'CloudLinux', 'PSBM', 'OracleLinux', 'OVS', 'OEL': {
      $pippkg       = 'python-pip'
      $rubyjsonpkg  = 'ruby-json'
      $awscli       = 'awscli'
      $enable_epel  = true
    }
    'Amazon': {
      case $::operatingsystemrelease {
      /^2/: {
          $pippkg       = undef
          $rubyjsonpkg  = 'rubygem-json'
          $awscli       = 'awscli'
          $enable_epel  = false
        }
        default: {
          $pippkg       = undef
          $rubyjsonpkg  = 'rubygem18-json'
          $awscli       = 'aws-cli'
          $enable_epel  = false
        }
      }
    }
    'ubuntu', 'debian': {
      $pippkg       = 'python-pip'
      $rubyjsonpkg  = 'ruby-json'
      $awscli       = 'awscli'
      $enable_epel  = false
    }
    'SLES', 'SLED', 'OpenSuSE', 'SuSE': {
      $pippkg       = 'python-pip'
      $rubyjsonpkg  = 'ruby-json'
      $awscli       = 'awscli'
      $enable_epel  = false
    }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }

}
