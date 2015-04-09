#
# == Class fdaapd::install
#
# Installs forked-daapd package
#
class fdaapd::install inherits fdaapd::params {

    package { 'fdaapd':
        name => $::fdaapd::params::package_name,
        ensure => installed,
    }
}
