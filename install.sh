#!/usr/bin/env bash

iso="/home/user/kvm/iso/CentOS-7-x86_64-Minimal-1908.iso"
name="test4"
pool="centos"

createVolume() { 
	virsh dumpxml $name 1>/dev/null && { echo "$name already exists"; exit 1;}
	virsh vol-dumpxml centosVol_$name --pool $pool || virsh vol-create-as $pool centosVol_$name 3GB
}


path="/data/$pool/centosVol_$name"

createVolume

sudo virt-install --name="$name" \
	--vcpus=1 \
	-cpu host \ #perf improvement
	--memory=1024 \
	--location "$iso" \
	--boot cdrom \
	--disk path=$path \
	--graphics vnc \
	--os-variant=centos7.0 \
	--initrd-inject ./ks.cfg \
	--extra-args "ks=file:/ks.cfg"
