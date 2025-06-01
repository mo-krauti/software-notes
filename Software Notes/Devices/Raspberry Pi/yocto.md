## mass storage flashing (ums)

On the cm4 usb in [[U-boot]] needs at least v2025-07-rc1. The [meta-lts-mixins](https://github.com/mo-krauti/meta-lts-mixins) contains a backport for yocto scarthgap release. 
Add
```
SRC_URI:remove:rpi = " file://0001-rpi-always-set-fdt_addr-with-firmware-provided-FDT-address.patch"
```
to `u-boot_%.bbappend` because this patch is no longer necessary in the updated u-boot version.
