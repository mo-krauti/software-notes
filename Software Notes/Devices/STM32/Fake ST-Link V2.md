Alternative firmware with nRST support for STM32

[Pre-built combined binaries](https://github.com/devanlai/dap42/blob/master/FLASHING.md#from-pre-built-images)

## Installing dapboot

```bash
sudo dnf install dfu-util
```

You need a second ST-Link for flashing the other one. Open up the case an connect the swd pins.
```bash
git clone https://github.com/devanlai/dapboot
cd src
make TARGET=STLINK
openocd -f /usr/share/openocd/scripts/interface/stlink.cfg -f /usr/share/openocd/scripts/target/stm32f1x.cfg -c 'init' -c 'reset halt' -c
 'stm32f1x unlock 0' -c 'reset halt' -c ' program dapboot.elf verify reset exit'
```

## Installing dap42

```bash
git clone https://github.com/devanlai/dapboot
cd src
make TARGET=STM32F103-DFUBOOT
make TARGET=STM32F103-DFUBOOT dfu-flash
```
