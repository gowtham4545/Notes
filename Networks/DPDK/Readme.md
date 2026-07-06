# [DPDK](https://www.slideshare.net/slideshow/dpdk-multi-architecture-high-performance-packet-processing-72911726/72911726)

Network Platforms Group 6

- Brands may belong to others: Acknowledges that some names and trademarks are owned by third parties.

- User Space: KNI, IGB_UIO, VFIO: Interfaces that allow user-level applications to directly access network hardware for improved performance.

- Core Components: EAL, MBUF, MEMPOOL, RING, TIMER: Fundamental libraries and data structures managing memory, buffers, and timing essential for network operations.

- Kernel Modules: UIO_PCI_GENERIC, FM10K, IXGBE, VMXNET3, IGB, E1000, I40E, XENVIRT, PCAP, MLX4, MLX5, ETHDEV, NULL, AF_PKT, BONDING, VIRTIOENIC, CXGBE, BNX2X: Drivers and modules that support various physical and virtual network devices, enabling communication and data transfer.

- PMDs: Native & Virtual: Poll Mode Drivers that bypass the kernel to provide high-speed packet processing for both physical and virtual devices.

- Utilities: SZEDATA2, NFP, MPIPE, HASH, LPM, JOBSTAT, DISTRIB, IP FRAG, KNI, REORDER, POWER, VHOST, IVSHMEM, SCHED, METER, PIPELINE, PORT TABLE: Tools and features for data manipulation, packet scheduling, fragmentation, power management, and virtual host support.

- Network Functions: Cloud, Enterprise, Comms: Network services and features tailored for cloud environments, enterprise networks, and communication systems.

- Crypto: CRYPTODEV, QAT, AESNI MB, AESNI GCM, SNOW 3G, NULL, PDUMP, KASUMI, THUNDERX, BNXT, QEDE, VHOST, ACL: Hardware and software accelerators for encryption, decryption, and security protocols.

- Frameworks: DPDK, OpenSSL: Core software frameworks that provide high-performance packet processing and secure communication.

- New in 16.11: ZUC: Introduction of the ZUC cryptographic algorithm, enhancing security capabilities.

## DPDK Overview

**Legacy DPDK:** Refers to earlier versions of the Data Plane Development Kit, which provided basic high-speed packet processing capabilities but lacked some modern optimizations and features.

**DPDK Acceleration Enhancements:** Improvements made to DPDK over time, including better hardware support, optimized drivers, enhanced poll mode drivers (PMDs), and advanced features that boost performance, reduce latency, and increase efficiency in network packet processing.

[Vpp Notes](./vpp.md)
