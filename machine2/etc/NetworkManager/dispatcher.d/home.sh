#!/bin/bash
 
routeip=$(ip route show match 0/0 | cut -d' ' -f3)
router_mac=$(ip neigh | grep $routeip | cut -d' ' -f5 | uniq)

if grep -q $router_mac /etc/homerouters
then
    ln -fs /etc/runit/sv/sshd /run/runit/service/
    ln -fs /etc/runit/sv/rsyncd-home /run/runit/service/
    ln -fs /etc/runit/sv/unison /run/runit/service/
else
    unlink /run/runit/service/sshd >/dev/null
    unlink /run/runit/service/rsyncd-home >/dev/null
    unlink /run/runit/service/unison >/dev/null
fi
