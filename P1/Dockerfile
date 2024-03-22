FROM    frrouting/frr:v8.4.0

RUN	
	echo 'service integrated-vtysh-config' > /etc/frr/vtysh.conf \
	&& sed -i 's/bgpd=no/bgpd=yes/' /etc/frr/daemons \
	&& sed -i 's/ospfd=no/ospfd=yes/' /etc/frr/daemons \
	&& sed -i 's/isisd=no/isisd=yes/' /etc/frr/daemons
