# Image Mode Artifacts

## Containerfiles

Rename rename file to Containerfile and build with `podman build -t <tag> .

- [RHEL 9.5 bootc image with Apache](./Containerfiles/RHEL9.5WithApache)
- [RHEL 9.5 bootc image with NGINX](./Containerfiles/RHEL9.5WithNGINX)


Use `bootc-image-builder` to convert image to QCOW2, ISO, AMI, etc