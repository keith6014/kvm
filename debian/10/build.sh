#!/usr/bin/env bash

#has all the stuff, https://preseed.debian.net/debian-preseed/bullseye/amd64-main-full.txt

build() {
	name="$1"
	virsh destroy $name --graceful
	virsh undefine $name
	disk=/media/user/writable/data/user/debian/$1.qcow2 && rm -rf $disk

	virt-install \
		--virt-type kvm \
		--name=$name \
		--vcpus=1 \
		--network bridge:virbr0,model=virtio \
		--memory=512 \
		--disk $disk,size=4 \
		--os-variant=debian10 \
		--location=/home/user/iso/debian-10.13.0-amd64-netinst.iso \
		--initrd-inject=preseed.cfg \
		--extra-args="ks=file:/preseed.cfg ipv6.disable=1 hostname=debian10"
	}

build debian10
