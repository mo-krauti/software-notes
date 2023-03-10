In the bootfs volume:
```bash
touch ssh
e wpa_supplicant.conf
```

wpa_supplicant.conf
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=DE

network={
    ssid="your_wifi_ssid"
    psk="wifi_password_here"
    key_mgt="WPA-PSK"
}
```
