## enable ssh

In the bootfs volume:
```bash
touch ssh
```

## setup user

userconf.txt
```
username:encrypted-password
```

cmd:
```fish
set -x RASPI_PASSWORD MY_SAFE_PW
echo $RASPI_PASSWORD | openssl passwd -6 -stdin | awk '{print "mo:" $0}' > userconf.txt
```
## enable wifi

### since raspbian bookworm

```fish
set -x NMCONNECTION_FILE_LOCATION /run/media/mo/rootfs/etc/NetworkManager/system-connections/MOPRECONFIGURED.nmconnection
sudo cp MOPRECONFIGURED.nmconnection $NMCONNECTION_FILE_LOCATION
sudo vim $NMCONNECTION_FILE_LOCATION
sudo chmod -R 600 $NMCONNECTION_FILE_LOCATION
sudo chown -R root:root $NMCONNECTION_FILE_LOCATION
```

### pre raspbian bookworm

wpa_supplicant.conf
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=DE

network={
    ssid="your_wifi_ssid"
    psk="wifi_password_here"
}
```
