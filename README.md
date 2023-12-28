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
