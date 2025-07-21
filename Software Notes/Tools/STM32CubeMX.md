## adding stm32 firmware packages from git to CubeMX

Inside `STM32Cube/Repository`:
```bash
git clone --recursive https://github.com/STMicroelectronics/STM32CubeH7.git
git checkout v1.12.1
```
View the `package.xml` and note:
```xml
<PackDescription Release="FW.H7.1.12.0" Patch="FW.H7.1.12.1">
```
Rename the git folder to `STM32Cube_{VERSION}`. 
So for this example it would be `STM32Cube_FW_H7_V1.12.1`. 
Now the firmware package should be listed in the CubeMX software package manager.

## change project from nucleo board to mcu only

I created two empty projects: One for the nucleo-h753zi board and one for the h753zi mcu only. 
Then I looked at the diff of the .ioc files:
```bash
diff nucleo-h753zi/nucleo-h753zi.ioc stm32h753zi-mcu-only/stm32h753zi-mcu-only.ioc
```
I removed some configuration differences which did not seem to be related this, just different defaults.
```
2d1
< BSP_IP_NAME=NUCLEO-H753ZI
16,19c15,18
< Mcu.IP1=NVIC
< Mcu.IP2=RCC
< Mcu.IP3=SYS
< Mcu.IP4=NUCLEO-H753ZI
---
> Mcu.IP1=MEMORYMAP
> Mcu.IP2=NVIC
> Mcu.IP3=RCC
> Mcu.IP4=SYS
105,106c63,64
< ProjectManager.ProjectFileName=nucleo-h753zi.ioc
< ProjectManager.ProjectName=nucleo-h753zi
---
> ProjectManager.ProjectFileName=stm32h753zi-mcu-only.ioc
> ProjectManager.ProjectName=stm32h753zi-mcu-only
115c73
< board=NUCLEO-H753ZI
< boardIOC=true
---
> board=custom
```
So to change the nucleo-h753zi project to a mcu only one, I did the following modifications to the .ioc: 
Remove the lines:
```
BSP_IP_NAME=NUCLEO-H753ZI
Mcu.IP4=NUCLEO-H753ZI
boardIOC=true
```
and change: 
`board=NUCLEO-H753ZI` to `board=custom` &  
`Mcu.IPNb=5` to `Mcu.IPNb=4`, because we removed one IP line.  
This seems to work, but I cannot guarantee anything.
