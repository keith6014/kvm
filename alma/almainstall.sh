#!/usr/bin/env bash

iso="/home/user/iso/AlmaLinux-8.7-x86_64-boot.iso"
name="test0"
pool="alma"

createVolume() { 
	virsh dumpxml $name 1>/dev/null && { echo "$name already exists"; exit 1;}
	virsh vol-dumpxml centosVol_$name --pool $pool || virsh vol-create-as $pool centosVol_$name 3GB
}


path="/data/$pool/centosVol_$name"
path="/media/user/writable/data/user/$pool/$name" && mkdir -p $path

createVolume

sudo virt-install --name="$name" \
	--vcpus=1 \
	--memory=1024 \
	--location "$iso" \
	--boot cdrom \
	--disk path=$path \
	--graphics vnc \
	--os-variant=almalinux8 \
	--initrd-inject ./ks.cfg \
	--extra-args "ks=file:/ks.cfg"
