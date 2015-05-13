#
# == Class fdaapd::service
#
# Enable forked-daapd service
#
class fdaapd::service inherits fdaapd::params {

    service { 'forked-daapd':
        name    => $::fdaapd::params::service_name,
        enable  => true,
        require => Class['fdaapd::config'],
    }
}
