#!/usr/bin/env bash
iso="/home/user/kvm/iso/CentOS-7-x86_64-Minimal-1908.iso"

path="/data/guest_images/centosVol0"

virsh vol-create-as guest_images centosVol0 3GB

sudo virt-install --name=test3 \
	--vcpus=1 \
	--memory=1024 \
	--location "$iso" \
	--boot cdrom \
	--disk path=$path \
	--graphics vnc \
	--os-variant=centos7.0 \
	--initrd-inject ./ks.cfg \
	--extra-args "ks=file:/ks.cfg"
