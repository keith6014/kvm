

== destroy pool ==
```bash
virsh pool-info guest_images
virsh pool-destroy "guest_images"
```


== create a pool ==
```bash
virsh pool-define-as guest_images --type dir --target /data01/guest_images
virsh pool-start guest_images
virsh pool-autostart guest_images
```

==== create a volume ====
```bash
virsh vol-create-as guest_images volume 1 4GB
```
