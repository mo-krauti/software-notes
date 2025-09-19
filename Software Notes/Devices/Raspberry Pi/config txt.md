## Boot from USB

Add
```
program_usb_boot_mode=1
```
to the bottom of `/boot/config.txt` and boot once from a sd card. 
Check by running:
```bash
vcgencmd otp_dump | grep 17:
```

## Enable UART

```
enable_uart=1
```
To enable the login console on the uart, also add:
```console=serial0,115200``` to `cmdline.txt`
The above seems to be cmdline seems to be default, you can disable it using `raspi-config`.  

Default configuration:

* full uart --> bluetooth
* mini uart --> gpio header

To swap this, add
```
dtoverlay=miniuart-bt
```
to `config.txt`

[official docs](https://www.raspberrypi.com/documentation/computers/config_txt.html)
