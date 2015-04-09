#
# == Class fdaapd::packetfilter
#
# Limits access to forked-daapd daap share based on IP-address/range
#
class fdaapd::packetfilter
(
    $daap_allow_ipv4_address,
    $daap_allow_ipv6_address

) inherits fdaapd::params
{

    # IPv4 rules
    firewall { '013 ipv4 accept daap port':
        provider => 'iptables',
        chain => 'INPUT',
        proto => 'udp',
        port => 3689,
        source => $daap_allow_ipv4_address,
        action => 'accept',
    }

    # IPv6 rules
    firewall { '013 ipv6 accept daap port':
        provider => 'ip6tables',
        chain => 'INPUT',
        proto => 'udp',
        port => 3689,
        source => $daap_allow_ipv6_address,
        action => 'accept',
    }
}
