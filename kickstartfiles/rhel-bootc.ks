text
keyboard us
lang en_US
timezone America/Chicago

network --bootproto=dhcp

zerombr
clearpart --all --initlabel --disklabel=gpt
part biosboot  --size=1    --fstype=biosboot
part /boot --size=1024 --fstype=ext4 --label=boot
part /boot/efi --size=100  --fstype=efi
part / --size=1000 --fstype=xfs --grow

ostreecontainer --no-signature-verification  --url=quay.io/tkagn/rhel-bootc-vm:httpd

services --enabled=sshd

rootpw --iscrypted locked
sshkey --username root "<ssh pub key?"

reboot




reboot