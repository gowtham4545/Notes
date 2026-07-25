# build the docker image for VPP
docker build -t vpp:v2 C:/Workspace/VPP

# run the docker container for VPP

sudo setfacl -m u:$(id -u):rwx /var/run/docker.sock # skip for windows, as it is not needed
# vpp name should in format VPP-<random number>
docker run --privileged --name VPP-$(date +%s) --cap-add=NET_ADMIN --cap-add=SYS_ADMIN -v /var/run/docker.sock:/var/run/docker.sock -v C:/Workspace/VPP:/vpp --rm -it vpp:v2 bash

# After the container is running, you can execute the following commands inside the container to build and run VPP:
apt-get install -y libvppinfra
apt-get install -y libvppinfra-dev
apt-get install -y vpp
apt-get install -y vpp-plugin-core
apt-get install -y vpp-plugin-dpdk
apt-get install -y vpp-dev
apt-get install -y python3-vpp-api

# Verify the installation of VPP and its plugins
dpkg -l | grep vpp

# edit and configure the VPP configuration file located at /etc/vpp/startup.conf to include the following lines:
dpdk {

    dev 0000:00:00.0 {
        num-rx-queues 4
        num-tx-queues 4
    }

}

vpp -c /etc/vpp/startup.conf
