#
# == Class fdaapd::config
#
# Configures forked-daapd media server
#
class fdaapd::config
(
    $music_dirs,
    $port,
    $password
)
{
    include os::params
    include fdaapd::params

    if $password == '' {
        $password_line = "#password = \"undefined\""
    } else {
        $password_line = "password = \"$password\""
    }

    file { 'fdaapd-forked-daapd.conf':
        name => "${::fdaapd::params::config_name}",
        content => template('fdaapd/forked-daapd.conf.erb'),
        ensure => present,
        owner => root,
        group => "${::os::params::admingroup}",
        require => Class['fdaapd::install'],
        notify => Class['fdaapd::service'],
    }
}
