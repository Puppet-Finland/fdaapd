#
# == Class fdaapd::monit
#
# Setup local monitoring for forked-daapd using monit
#
class fdaapd::monit {

    monit::fragment { 'fdaapd-forked-daapd.monit':
        basename => 'forked-daapd',
        modulename => 'fdaapd',
    }
}
