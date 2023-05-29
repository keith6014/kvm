#!/usr/bin/env bash

#has all the stuff, https://preseed.debian.net/debian-preseed/bullseye/amd64-main-full.txt

build() {
	name="$1"
	virsh destroy $name --graceful
	virsh undefine $name


	virt-install \
		--virt-type kvm \
		--name=$name \
		--vcpus=1 \
		--network bridge:virbr0,model=virtio \
		--memory=512 \
		--disk /tmp/d11.qcow2,size=5 \
		--os-variant=debian11 \
		--location=/home/user/iso/debian-11.7.0-amd64-netinst.iso \
		--initrd-inject=preseed.cfg \
		--extra-args="ks=file:/preseed.cfg ipv6.disable=1 hostname=debian11"
	}

build debian11
