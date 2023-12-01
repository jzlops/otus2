sudo yum install https://zfsonlinux.org/epel/zfs-release.el8_4.noarch.rpm -y

yum install -y epel-release
yum install -y kernel-devel
yum install -y zfs

sudo echo zfs >/etc/modules-load.d/zfs.conf

sudo reboot
