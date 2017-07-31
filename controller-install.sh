!#/bin/bash

qemu-img create /root/images/vm.controller 60G

virt-install \
--name "controller" \
--cpu host \
--vcpus 8 \
--ram 32768 \
--os-type=linux \
--disk path=/root/images/vm.controller \
--network bridge=br-pxe,model=virtio \
--network bridge=br-public,model=virtio \
--network bridge=br-aux,model=virtio \
--autostart \
--pxe
--boot network,hd,menu=on \
--graphics vnc,listen=0.0.0.0,password=mysecretpassword \
--console pty,target_type=serial \
--force

