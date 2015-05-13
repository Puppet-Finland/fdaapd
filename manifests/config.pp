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

) inherits fdaapd::params
{
    if $password {
        $password_line = "password = \"${password}\""
    } else {
        $password_line = "#password = \"undefined\""
    }

    file { 'fdaapd-forked-daapd.conf':
        ensure  => present,
        name    => $::fdaapd::params::config_name,
        content => template('fdaapd/forked-daapd.conf.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        require => Class['fdaapd::install'],
        notify  => Class['fdaapd::service'],
    }
}
