#!/bin/ash

export UNBOUND_IDENTITY=${UNBOUND_IDENTITY:-`hostname`}
if [ ! -e "/etc/unbound/root.key" ] ; then
  /unbound/sbin/unbound-anchor
fi
if [ ! -e "/etc/unbound/unbound_server.key" ] ; then
  /unbound/sbin/unbound-control-setup
fi
if [ ! -e "/etc/unbound/ticket.key" ] ; then
  openssl rand 80 -out /etc/unbound/ticket.key
fi

chown unbound:unbound -R /etc/unbound

envsubst < /etc/unbound/unbound.conf.tpl > /etc/unbound/unbound.conf && cat /etc/unbound/unbound.conf
exec "$@"
