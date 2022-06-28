#!/bin/bash
for i in $(fdisk -l | grep -wo "/dev/sd[b-z]" | sort)
do
dd if=/dev/zero of=$i bs=1024 count=1024
fdisk $i << EOF
n
p



w
EOF

partprobe $i
mkfs.ext4 ${i}1
done

mkdir /b3 /c4 /d5 /e6
fdisk -l | grep -w "/dev/sd[b-z]" | sed -r 's/.*(\/d.{8}).*/\1/g' | sed -r
 's/(.*)(.)：(.*)/mount \1\21 \/\2\3/' | bash
fdisk -l | grep -w "/dev/sd[b-z]" | sed -r 's/.*(\/d.{8}).*/\1/g' | sed -r
 's/(.*)(.)：(.*)/\1\21 \/\2\3 xfs default 0 0/' >> /etc/fstab
iptables -F
systemctl stop firewalld
setenforce 0

cat << EOF >> /etc/hosts
192.168.200.100 node1
192.168.200.101 node2
192.168.200.102 node3
192.168.200.103 node4
EOF
read -p "请输入主机名: " hn
hostname $hn
bash
