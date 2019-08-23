server:
	verbosity: ${UNBOUND_VERBOSITY}
	extended-statistics: yes
	num-threads: ${UNBOUND_NUM_THREADS}

	interface-automatic: yes
	
	outgoing-range: ${UNBOUND_OUTGOING_RANGE}

	outgoing-num-tcp: ${UNBOUND_OUTGOING_NUM_TCP}
	incoming-num-tcp: ${UNBOUND_INCOMING_NUM_TCP}
	so-rcvbuf: ${UNBOUND_SO_RCVBUF}
	so-sndbuf: ${UNBOUND_SO_SNDBUF}

	edns-buffer-size: ${UNBOUND_EDNS_BUFFER_SIZE}
	max-udp-size: ${UNBOUND_MAX_UDP_SIZE}

	stream-wait-size: ${UNBOUND_STREAM_WAIT_SIZE}
	msg-buffer-size: ${UNBOUND_MSG_BUFFER_SIZE}
	msg-cache-size: ${UNBOUND_MSG_CACHE_SIZE}
	msg-cache-slabs: ${UNBOUND_MSG_CACHE_SLABS}
	num-queries-per-thread: ${UNBOUND_NUM_QUERIES_PER_THREAD}
	jostle-timeout: ${UNBOUND_JOSTLE_TIMEOUT}
	delay-close: ${UNBOUND_DELAY_CLOSE}

	rrset-cache-size: ${UNBOUND_RRSET_CACHE_SIZE}
	rrset-cache-slabs: ${UNBOUND_RRSET_CACHE_SLABS}

	cache-max-ttl: ${UNBOUND_CACHE_MAX_TTL}
	cache-max-negative-ttl: ${UNBOUND_CACHE_NEGATIVE_TTL}

	infra-host-ttl: ${UNBOUND_INFRA_HOST_TTL}
	infra-cache-min-rtt: ${UNBOUND_INFRA_CACHE_MIN_RTT}
	infra-cache-slabs: ${UNBOUND_INFRA_CACHE_SLABS}
	infra-cache-numhosts: ${UNBOUND_INFRA_CACHE_NUMHOSTS}

	do-ip4: ${UNBOUND_DO_IPV4}
	do-ip6: ${UNBOUND_DO_IPV6}

	do-udp: yes
	do-tcp: yes
	do-daemonize: yes

	access-control: ::0/0 refuse
	access-control: 0.0.0.0/0 refuse
	access-control: 127.0.0.0/8 allow
	access-control: 10.0.0.0/8 allow
	access-control: 172.16.0.0/12 allow
	access-control: 192.168.0.0/16 allow

	access-control: ::1 allow
	access-control: ::ffff:127.0.0.1 allow

	directory: "/etc/unbound"
	chroot: ""

	logfile: ""
	use-syslog: no
	log-time-ascii: yes
	
	pidfile: "/unbound/var/run/unbound.pid"
	
	# file to read root hints from.
	# get one from https://www.internic.net/domain/named.cache
	root-hints: "${UNBOUND_ROOT_HINTS}"

	hide-identity: ${UNBOUND_HIDE_IDENTITY}
	hide-version: ${UNBOUND_HIDE_VERSION}

	hide-trustanchor: ${UNBOUND_HIDE_TRUSTANCHOR}

	identity: "${UNBOUND_IDENTITY}"
	version: "${UNBOUND_VERSION}"

 	harden-short-bufsize: yes
	harden-large-queries: yes
	harden-glue: yes
	harden-dnssec-stripped: yes
	harden-below-nxdomain: yes
	harden-referral-path: yes
	harden-algo-downgrade: no

	qname-minimisation: ${UNBOUND_QNAME_MINIMISATION}
	qname-minimisation-strict: ${UNBOUND_QNAME_MINIMISATION_STRICT}
	aggressive-nsec: ${UNBOUND_AGGRESSIVE_NSEC}

	prefetch: ${UNBOUND_PREFETCH}
	prefetch-key: ${UNBOUND_PREFETCH_KEY}
	deny-any: ${UNBOUND_DENY_ANY}

	rrset-roundrobin: ${UNBOUND_RRSET_ROUNDROBIN}
	minimal-responses: ${UNBOUND_MINIMAL_RESPONSE}
	module-config: "${UNBOUND_MODULE_CONFIG}"

	auto-trust-anchor-file: "/etc/unbound/root.key"
	trust-anchor-signaling: no
	root-key-sentinel: no

	val-log-level: ${UNBOUND_VAL_LOG_LEVEL}


	# service clients over TLS (on the TCP sockets), with plain DNS inside
	# the TLS stream.  Give the certificate to use and private key.
	# default is "" (disabled).  requires restart to take effect.
	tls-service-key: "${UNBOUND_TLS_SERVICE_KEY}"
	tls-service-pem: "${UNBOUND_TLS_SERVICE_PEM}"
	tls-port: 853

	# cipher setting for TLSv1.2
	tls-ciphers: "${UNBOUND_TLS_CIPHERS}"
	# cipher setting for TLSv1.3
	# tls-ciphersuites: "${UNBOUND_TLS_CHIPHERSUITES}"
	
	# Add the secret file for TLS Session Ticket.
	# Secret file must be 80 bytes of random data.
	# First key use to encrypt and decrypt TLS session tickets.
	# Other keys use to decrypt only.
	# requires restart to take effect.
	tls-session-ticket-keys: "/etc/unbound/ticket.key"

remote-control:
	control-enable: yes
	control-interface: 127.0.0.1