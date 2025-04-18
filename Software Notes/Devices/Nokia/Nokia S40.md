## Remove security questions on unsigned j2me apps 
Use [gammu](https://wammu.eu) to access you phone's filesystem.

1. Set app permission to not allowed
2. Load `A://hiddenfolder/_jmr_suite_attrib_file.jmr`
3. Set app permission to always ask
4. Load `A://hiddenfolder/_jmr_suite_attrib_file.jmr`
5. Compare files using hex diff, there will be a difference like
  `01 01 00` and `02 02 00`
6. Write `06 06 00` to the difference and push the file back to the phone  

Now the permission should be set to always allowed.
