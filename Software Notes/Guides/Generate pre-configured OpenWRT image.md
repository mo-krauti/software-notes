* Visit https://firmware-selector.openwrt.org
* select your device model
* press `Customize installed packages and/or first boot script`
* add this into `Script to run on first boot (uci-defaults)`
* configure your SSID and password
* request build

```bash
uci -q batch << EOI
set network.lan.ipaddr='192.168.178.1'
set wireless.@wifi-device[0].disabled='0'
set wireless.@wifi-device[0].channel='4'
set wireless.@wifi-iface[0].device='radio0'
set wireless.@wifi-iface[0].ssid='OpenWrt0815'
set wireless.@wifi-iface[0].encryption='psk2'
set wireless.@wifi-iface[0].key='MyPassword'
commit wireless
EOI
EOF
```
