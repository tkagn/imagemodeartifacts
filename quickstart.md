# Quickstart - RHEL in Image Mode

## Prepare environment

```bash
sudo dnf install -y bootc butane podman
```

## Pull bootable image

```bash
podman login registry.redhat.io
podman pull registry.redhat.io/rhel9/rhel-bootc:latest
podman images
```

## Build image

```bash
podman build -t infra-services:5000/rhel9/rhel9-bootc:<version> -f Containerfile
```

## Write image to disk

```bash

```




```bash
cat << EOF >> Containerfile
FROM registry.redhat.io/rhel10/rhel-bootc:latest
RUN dnf -y install cloud-init && \
    ln -s ../cloud-init.target /usr/lib/systemd/system/default.target.wants && \
    dnf clean all
EOF

podman build -t rhel10-bootc:latest .
podman run -it --rm --name rhel10-bootc registry.redhat.io/rhel10/rhel-bootc /bin/bash
```

```bash
mkdir output
podman quay.io/fedora/fedora-bootc:42
podman pull registry.redhat.io/rhel10/bootc-image-builder
mkdir output
podman run --rm -it --privileged --pull=newer --security-opt label=type:unconfined_t -v ./:/output -v /var/lib/containers/storage:/var/lib/containers/storage registry.redhat.io/rhel10/bootc-image-builder:latest --type qcow2 --rootfs xfs localhost/fedora-bootc:42

virt-install -v -n imgmode1.tkagn.io --vcpus 4 --memory 4096 --os-variant rhel9.2 --import --disk 'path=/mnt/vms/imgmode1/imgmode1.qcow2',bus=virtio,format=qcow2 --cloud-init meta-data='/mnt/vms/imgmode1/meta-data',user-data='/mnt/vms/imgmode1/user-data' --network network=default,model=virtio --network bridge=bridge-vlan103,model=virtio --graphics vnc --console pty,target_type=serial --noautoconsole --autostart --noreboot

```
