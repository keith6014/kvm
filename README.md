== show all VMs ==
```bash
virsh list --all
```

== show all pools ==
```bash
virsh pool-list --all
```

== destroy pool ==
```bash
virsh pool-info guest_images
virsh pool-destroy "guest_images"
```

== create a pool ==
```bash
virsh pool-define-as guest_images --type dir --target /data/guest_images
virsh pool-start guest_images
virsh pool-autostart guest_images
```

==== create a volume ====
```bash
virsh vol-create-as guest_images volume 1 4GB
```

==== Console to a VM ===
```bash
virt-viewer #gui
```

==== Remove a VM ===
```bash
virsh destroy vmname
virsh undefine vmname
```

=== Network assign ip addr ===
* Generate MAC address
```bash
  perl -e 'for ($i=00;$i<6;$i++){@m[$i]=int(rand(256));} printf "00:16:3E:%X:%X:%X\n",@m;'
```
* Build Vm
  ```bash
  build debian10b /data/ssd/libvirt "macaddress"
  ```
