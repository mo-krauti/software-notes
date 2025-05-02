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
