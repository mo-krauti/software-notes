## extending machine configuration

Create `conf/machine/raspi4-custom.md`
```
# keep the original machine as an override with high prio
MACHINEOVERRIDES =. "raspberrypi4:"
require conf/machine/raspberrypi4.conf
MACHINE_PREFIX_raspi4-custom = "raspberrypi4"


# start of our costumizations:
RPI_USE_U_BOOT = "1"
ENABLE_UART = "1"
```
[Source](https://community.toradex.com/t/yocto-machine-customization-best-practice/15304/9)

## modifying kernel configuration

[Modify the linux kernel with configuration fragments in Yocto](https://wiki.koansoftware.com/index.php/Modify_the_linux_kernel_with_configuration_fragments_in_Yocto)  
This also works for U-boot.

## minimize rootfs size

Extract the rootfs and have a look at its disk usage using ncdu.
