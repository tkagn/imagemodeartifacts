# Image Mode Kickstart files


## Create VM


```bash
virt-install --name rhel9-server --memory 4096 --vcpus 4 --os-variant rhel9.5 --disk size=30G --network network=default --location ./rhel9.iso --initrd-inject ks.cfg --extra-args "inst.ks=http://infra-services:9000/ks.cfg"
```