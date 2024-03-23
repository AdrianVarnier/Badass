bash
vtysh
conf t

int eth0
ip addr 10.1.1.1/30
int eth1
ip addr 10.1.1.5/30
int eth2
ip addr 10.1.1.9/30
int lo
ip addr 1.1.1.1/32

router bgp 1
neighbor DYNAMIC peer-group
neighbor DYNAMIC remote-as 1
neighbor DYNAMIC update-source lo
bgp listen range 1.1.1.0/24 peer-group DYNAMIC

address-family l2vpn evpn
neighbor DYNAMIC activate
neighbor DYNAMIC route-reflector-client

router ospf
network 0.0.0.0/0 area 0
