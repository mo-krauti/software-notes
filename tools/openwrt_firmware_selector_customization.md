```bash
uci -q batch << EOI
set network.lan.ipaddr='192.168.178.1'
set wireless.@wifi-device[0].disabled='0'
set wireless.@wifi-device[0].channel='4'
set wireless.@wifi-iface[0].device='radio0'
set wireless.@wifi-iface[0].ssid='OpenWrt0815'
set wireless.@wifi-iface[0].encryption='psk2'
set wireless.@wifi-iface[0].key='VeryPrivateKey'
commit wireless
EOI
EOF
```
