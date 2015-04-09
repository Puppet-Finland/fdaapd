#
# == Class: fdaapd::params
#
# Defines some variables based on the operating system
#
class fdaapd::params {

    include os::params

    case $::osfamily {
        'Debian': {
            $package_name = 'forked-daapd'
            $config_name = '/etc/forked-daapd.conf'
            $service_name = 'forked-daapd'
            $pidfile = '/var/run/forked-daapd.pid'
        }
        default: {
            fail("Unsupported operating system ${::osfamily}")
        }
    }

    if $::has_systemd == 'true' {
        $service_start = "${::os::params::systemctl} start ${service_name}"
        $service_stop = "${::os::params::systemctl} stop ${service_name}"
    } else {
        $service_start = "${::os::params::service_cmd} ${service_name} start"
        $service_stop = "${::os::params::service_cmd} ${service_name} stop"
    }
}
