#!/usr/bin/env bash

virt-install --name=test \
	--vcpus=1 \
	--memory=1024 \
	--cdrom=/home/user/iso/AlmaLinux-8.7-x86_64-boot.iso \
	--disk size=2 \
	--os-variant=almalinux8
