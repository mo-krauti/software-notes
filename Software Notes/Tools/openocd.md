```fish
openocd -f /usr/share/openocd/scripts/board/st_nucleo_f7.cfg
```
Or with [RTOS Support](https://openocd.org/doc/html/CPU-Configuration.html#rtostype)
```fish
openocd -f board/st_nucleo_f7.cfg -c '$_TARGETNAME configure -rtos ThreadX'
```

Connect to gdb server:
```fish
arm-none-eabi-gdb -ex 'target extended-remote localhost:3333' Debug/test_netxduo_dhcp_client_stm_ide.elf
```
Inside gdb shell:
```fish
#load program
load 
# openocd commands
monitor ...
```
