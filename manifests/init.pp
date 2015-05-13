#
# == Class: fdaapd
#
# Setup a forked-daap DAAP server
#
# == Parameters
#
# [*manage*]
#   Manage forked-daap with Puppet. Valid values are 'present' (default) and 
#   'absent'.
# [*music_dirs*]
#   A list of directories with the music files to share 
# [*port*]
#   The TCP port on which fdaapd listens for requests. Defaults to 3689.
# [*password*]
#   The password for the DAAP share. Leave undefined for no password.
# [*daap_allow_ipv4_address*]
#   IPv4 address/subnet from which to allow connections to the daap share. 
#   Defaults to 127.0.0.1.
# [*daap_allow_ipv6_address*]
#   IPv6 address/subnet from which to allow connections to the daap share. 
#   Defaults to ::1.
#
# == Examples
#
#   class { 'fdaapd':
#       music_dirs => '/data/music',
#       daap_allow_ipv4_address => '192.168.50.0/24',
#   }
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class fdaapd
(
    $manage = 'yes',
    $music_dirs,
    $port=3689,
    $password=undef,
    $daap_allow_ipv4_address='127.0.0.1',
    $daap_allow_ipv6_address='::1'
)
{

if $manage == 'yes' {

    include ::fdaapd::install

    class { '::fdaapd::config':
        music_dirs => $music_dirs,
        port       => $port,
        password   => $password,
    }

    include ::fdaapd::service

    if tagged('monit') {
        include ::fdaapd::monit
    }

    if tagged('packetfilter') {
        class { '::fdaapd::packetfilter':
            daap_allow_ipv4_address => $daap_allow_ipv4_address,
            daap_allow_ipv6_address => $daap_allow_ipv6_address,
        }
    }

}
}
