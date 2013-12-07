#
# == Class: fdaapd::params
#
# Defines some variables based on the operating system
#
class fdaapd::params {

    case $::osfamily {
        'Debian': {
            $package_name = 'forked-daapd'
            $config_name = '/etc/forked-daapd.conf'
            $service_name = 'forked-daapd'
            $pidfile = '/var/run/forked-daapd.pid'
            $service_start = "/usr/sbin/service $service_name start"
            $service_stop = "/usr/sbin/service $service_name stop"
        }
        default: {
            $package_name = 'forked-daapd'
            $config_name = '/etc/forked-daapd.conf'
            $service_name = 'forked-daapd'
            $pidfile = '/var/run/forked-daapd.pid'
            $service_start = "/usr/sbin/service $service_name start"
            $service_stop = "/usr/sbin/service $service_name stop"
        }
    }
}
