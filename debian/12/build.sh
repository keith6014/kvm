#!/usr/bin/env bash

#has all the stuff, https://preseed.debian.net/debian-preseed/bullseye/amd64-main-full.txt

build() {
	name="$1"
	disk="$2"
	mac="$3"

	virsh destroy $name --graceful
	virsh undefine $name
	disk="$2/$1.qcow2" && rm -rf $disk

	virt-install \
		--virt-type kvm \
		--name=$name \
		--vcpus=1 \
		--network bridge:virbr0,model=virtio,mac=$mac \
		--memory=512 \
		--disk $disk,size=5 \
		--os-variant=debian12 \
		--location=/home/user/iso/debian-12.4.0-amd64-netinst.iso \
		--initrd-inject=preseed.cfg \
		--extra-args="ks=file:/preseed.cfg ipv6.disable=1 hostname=$name"
	}

build debian12-core01 /data/ssd/libvirt "52:54:00:3f:d7:6C"
