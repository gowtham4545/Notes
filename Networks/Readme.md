# Networks

## OSI Layers

![OSI Layer](./The-7-Layer-OSI-Model.webp)
![Data trace](./data.png)

## Traditional RPC

![RPC](https://cdn.prod.website-files.com/5ff66329429d880392f6cba2/6718c393216df138ca4398cb_62d676c42955fd6aac1163ff_RPC%2520work.jpeg)

## GRPC

[![GRPC](https://cdn.prod.website-files.com/5ff66329429d880392f6cba2/6718c393216df138ca4398c7_62d676e9b43387516e61f5c5_gRPC%2520work.jpeg)](https://www.wallarm.com/what/grpc-vs-rest-comparing-key-api-designs-and-deciding-which-one-is-best)

## Layers

### L1

**Bits & Bytes**
1 byte = 8 bits
- For packets, Speed is always measure in *bits per second* (Kbps, Mbps, Gbps)
- But anyhow, Data on hardrive is measured in *Bytes per second* (KBps, MBps, GBps)

![alt text](ethernet.png)
**Ethernet** (*IEEE 802.3*)
Types of Ethernet Connectors:

1. RJ45(Registered Jack 45)(port type) - Copper cable (UTP - Unshielded Twisted Pair)

2. SFP (Small Form-factor Pluggable)(port type) - Fiber Optic - Glass cable

### L2

**MAC Address** (Media Access Control)
- 48 bits (6 bytes) long
- Written in Hexadecimal (base 16)
- Unique for each network interface card (NIC)
- Format: `XX:XX:XX:XX:XX:XX` (e.g., `00:1A:2B:3C:4D:5E`)

**Switches** operate at Layer 2 (Data Link Layer) and use MAC addresses to forward data frames within a local area network (LAN).
- When a switch receives a data frame, it reads the destination MAC address and forwards the frame to the appropriate port based on its MAC address table.
- If the destination MAC address is not in the switch's MAC address table, it will broadcast the frame to all ports except the one it was received on, which can lead to network congestion.

<!-- **VLANs** (Virtual Local Area Networks) allow network administrators to segment a physical network into multiple logical networks at Layer 2. This can improve security and reduce broadcast traffic by isolating different groups of devices within the same physical infrastructure.
- VLANs are identified by a VLAN ID (VID) and can be configured on switches to control which devices belong to which VLANs, allowing for better network management and security.
- VLANs can also be used to create separate broadcast domains, which can help reduce network congestion and improve performance by limiting the scope of broadcast traffic.
- VLANs can be implemented using IEEE 802.1Q standard, which adds a VLAN tag to Ethernet frames to identify the VLAN membership of each frame.
- VLANs can be used in conjunction with other network technologies, such as routing and firewalling, to create more complex and secure network architectures.
- VLANs can also be used to create separate broadcast domains, which can help reduce network congestion and improve performance by limiting the scope of broadcast traffic.
- VLANs can be implemented using IEEE 802.1Q standard, which adds a VLAN tag to Ethernet frames to identify the VLAN membership of each frame.
- VLANs can be used in conjunction with other network technologies, such as routing and firewalling, to create more complex and secure network architectures.
- VLANs can also be used to create separate broadcast domains, which can help reduce network congestion and improve performance by limiting the scope of broadcast traffic.
- VLANs can be implemented using IEEE 802.1Q standard, which adds a VLAN tag to Ethernet frames to identify the VLAN membership of each frame.
- VLANs can be used in conjunction with other network technologies, such as routing and firewalling, to create more complex and secure network architectures. -->


### L3

**IP Address** (Internet Protocol Address)

- 32 bits (4 bytes) long for IPv4, 128 bits (16 bytes) long for IPv6
- Written in decimal (IPv4) or hexadecimal (IPv6) format
- The `/24` notation represents the subnet mask, indicating that the first 24 bits of the IP address are used for the network portion.

> `/32` is the subnet mask for a single host, meaning that all 32 bits are used for the host portion of the IP address.
> `x.x.x.0` will be gateway address for the network, and `x.x.x.255` will be broadcast address for the network.
> `/30` is the subnet mask for a point-to-point link, meaning that 30 bits are used for the network portion and 2 bits are used for the host portion, allowing for 2 usable IP addresses on the link.
> ![alt text](subnets.png)

**Routers** operate at Layer 3 (Network Layer) and use IP addresses to forward data packets between different networks.

- When a router receives a data packet, it reads the destination IP address and forwards the packet to the appropriate next hop based on its routing table.
