bash

ip link add name vxlan10 type vxlan id 10 dev eth0 dstport 4789
ip link set dev vxlan10 up
ip link add name br0 type bridge
ip link set dev br0 up
brctl addif br0 eth1
brctl addif br0 vxlan10

vtysh
conf t

int eth0
ip address 10.1.1.2/30
ip ospf area 0
int lo
ip address 1.1.1.2/32
ip ospf area 0

router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo

address-family l2vpn evpn
neighbor 1.1.1.1 activate
advertise-all-vni

router ospf