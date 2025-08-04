Codename: nokia-leo

## bootloader installation

Download: 

  * [lk2nd-msm8909.img](https://github.com/msm8916-mainline/lk2nd/releases/download/20.0/lk2nd-msm8909.img) secondary bootloader
  * [8k.mbn](https://edl.bananahackers.net/loaders/8k.mbn) edl loader

Install [[edl]]. Enable debugging by dialing `*#*#33284#*#*`
```bash
adb reboot recovery
# make sure it reports ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (QDL mode)
lsusb
# test edl connection
python3 ~/projects/repos/edl/edl.py printgpt --loader 8k.mbn
# backup stock boot and recovery partitions
mkdir stock-backup
python3 ~/projects/repos/edl/edl.py r boot stock-backup/boot.img --loader 8k.mbn
python3 ~/projects/repos/edl/edl.py r recovery stock-backup/recovery.img --loader 8k.mbn
# write lk2nd to boot partition
python3 ~/projects/repos/edl/edl.py w boot lk2nd-msm8909.img --loader 8k.mbn
```
Now disconnect the usb cable and remove the battery.

## postmarketOS installation

```bash
# install kernel via lk2nd fastboot into boot partition
pmbootstrap flasher flash_kernel
# install rootfs to sd card
pmbootstrap install --disk=/dev/sdd
```

On device:
```bash
sudo tinydm-set-session -f -s /usr/share/wayland-sessions/bananui.desktop
# load display driver
modprobe panel-mipi-dbi
# always load display driver on boot
echo panel-mipi-dbi | sudo tee /etc/modules-load.d/panel-mipi-dbi.conf

export WAYLAND_DISPLAY=wayland-1
alacritty
```

Additional installed packages:
```
sway tmux fish htop modemmanager
```

## Links

* [postmarketOS wiki](https://wiki.postmarketos.org/wiki/Nokia_6300_4G_(nokia-leo))
* [bananahackers Nokia 6300 4G rooting tutorial](https://sites.google.com/view/bananahackers/devices/nokia-8000-4g-nokia-6300-4g-2020)
* [bananahackers device list](https://wiki.bananahackers.net/en/devices)
* [GitHub info page](https://github.com/bmndc/nokia-leo/tree/docs)
