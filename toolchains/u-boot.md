# U-boot

## compiling

Install the `arm-none-eabi-` toolchain.

Fedora dependencies:
```
sudo dnf install -y bison flex ncurses-devel bc make swig python3-devel openssl-devel openssl-devel-engine gnutls-devel
```

## cli
List devices:
```
mmc list
```

## ums flashing
Make sure
```
CONFIG_CMD_USB_MASS_STORAGE=y
CONFIG_USB_FUNCTION_MASS_STORAGE=y
```
is set in your u-boot config. Boot and repeatedly press space to drop into a u-boot prompt. 
Use
```
ums 0 mmc 0
```
to expose the mmc 0 block device via usb port 0.
[ums docs](https://docs.u-boot.org/en/v2025.01/usage/cmd/ums.html)
