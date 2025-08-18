Add gsm connection:
```bash
nmcli c add type gsm ifname <interface> con-name <name> apn <operator_apn> username <user> password <password> pin <PIN>
```
  
[MAC adrress randomization](https://fedoramagazine.org/randomize-mac-address-nm/)


## connection configurations

[docs](https://networkmanager.dev/docs/api/latest/ch01.html)

### lte

Add your apn and the sim pin if the card is locked
`lte.nmconnection`
```
[connection]
id=lte
uuid=e555c097-f331-4fab-95a7-8fdf0ebdbf53
type=gsm
autoconnect=false

[gsm]
apn=your_apn_here

[ipv4]
method=auto

[ipv6]
addr-gen-mode=default
method=auto

[proxy]
```

## [[yocto]]

### cellular modems

Enable qmi & mbim support in kernel using this configuration fragment:
```
CONFIG_USB_NET_CDC_MBIM=m
CONFIG_USB_NET_QMI_WWAN=m
CONFIG_USB_WDM=m
```

Create an `networkmanager_%.bbappend`:
```
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://lte.nmconnection"

PACKAGECONFIG:append = " modemmanager "

do_install:append() {
    install -m 0600 ${WORKDIR}/lte.nmconnection ${D}${sysconfdir}/NetworkManager/system-connections/lte.nmconnection
}
```
