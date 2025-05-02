## hardware acceleration

Check for cpu support
```bash
lscpu | grep Virtualization
```
Check that the kernel module is loaded
```bash
lsmod | grep kvm
```
Check libvirt capabilities
```bash
virsh capabilities
```
Check that vm is using kvm
```ps aux | grep accel```
Should list `-accel kvm`
