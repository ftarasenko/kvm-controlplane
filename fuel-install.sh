!#/bin/bash

qemu-img create /root/images/vm.fuel 80G

virt-install \
--name "fuel" \
--cpu host \
--vcpus 4 \
--ram 8096 \
--os-type=linux \
--disk path=/root/images/vm.fuel \
--cdrom /var/lib/libvirt/images/MirantisOpenStack-9.0.iso \
--network bridge=br-public,model=virtio \
--network bridge=br-pxe,model=virtio \
--autostart \
--boot hd,cdrom,menu=on \
--graphics vnc,listen=0.0.0.0,password=mysecretpassword \
--console pty,target_type=serial \
--force

