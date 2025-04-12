```fish
sudo dnf install arm-none-eabi-gcc arm-none-eabi-g++ arm-none-eabi-newlib clangd
```
gdb from copr:
```fish
dnf copr enable rleh/arm-none-eabi-gdb
dnf install arm-none-eabi-gdb
```

## lunarvim config

Add `.clangd_lsp.json` to workspace:
```json
{"cmd": 
  ["/usr/bin/clangd",
    "--query-driver=/usr/bin/arm-none-eabi-gcc"]
}
```
