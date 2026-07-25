# Linux

## Boot Process

```architecture
[ Power On ] 
     │
     ▼
[ Motherboard BIOS / UEFI ] -> Finds and runs the Bootloader (e.g., GRUB)
     │
     ▼
[ Bootloader ] -------------> Loads the Kernel file into RAM and runs it
     │
     ▼
[ Kernel (The Code) ] ------> Runs raw machine code to initialize RAM, CPU, and drivers
     │
     ▼
[ Kernel (PID 0) ] ---------> The kernel establishes its own "idle" loop (PID 0)
     │
     ▼
[ Init Process (PID 1) ] ---> The kernel spawns the very first user-space process (init/systemd)
     │
     ▼
[ User Space App Tree ] ----> Init forks and executes your desktop, browser, and background apps
```

## Commands

###

```shell
# listing all hardware on the system
lshw
# list all network interfaces
lshw -class network -businfo
```

Example output:

```shell
Bus info          Device         Class          Description
===========================================================
pci@0000:19:00.0  eno1           network        Ethernet Controller 10G X550T
pci@0000:3b:00.2  enp59s0f2      network        I350 Gigabit Network Connection
pci@0000:af:00.0  enp175s0f0np0  network        BCM57414 NetXtreme-E 10Gb/25Gb RDMA Ethernet Controller
```

`pci@domain:bus:device.function`

- `enp59s0f2` decodes as PCI bus 59 (0x3b = 59 decimal), slot 0, function 2
- `enp175s0f0np0` decodes as PCI bus 175 (0xaf = 175 decimal), slot 0, function 0, non-physical function 0. They are 25Gb Capable that supports `RDMA` (Remote Direct Memory Access) and is a dual-port NIC. The other port is `enp175s0f1np1`.

## Kali
