#!/usr/bin/env bash

virt-install \
	--name=test \
	--vcpus=1 \
	--memory=1024 \
	--disk size=2 \
	--os-variant=almalinux8 \
	--location=/home/user/iso/AlmaLinux-8.7-x86_64-boot.iso \
	--initrd-inject=ks.cfg 
	--extra-args="ks=file:/ks.cfg console=tty0"
