## systemd service
`/etc/systemd/system/bluetooth-device@.service`
```
[Unit]
Description=Bluetooth Device %i
After=bluetooth.target pulseaudio.service
StartLimitIntervalSec=60
StartLimitBurst=5

[Install]
WantedBy=multi-user.target

[Service]
ExecStart=/usr/local/bin/systemd-bluetooth.sh %i
Restart=on-failure
RestartSec=10
```

## bash script
`/usr/local/bin/systemd-bluetooth.sh`
```bash
#!/bin/bash

MAC_ADDR=$1

monitor_connection() {
  echo "started connectivity watchdog for device ${MAC_ADDR}"
  while true
  do
    bluetoothctl info $MAC_ADDR | grep "Connected" | grep no && on_disconnected_exit
    sleep 10
  done
}

connect() {
  bluetoothctl connect $MAC_ADDR
}

disconnect() {
  bluetoothctl disconnect $MAC_ADDR
}

on_disconnected_exit() {
  echo "device ${MAC_ADDR} is not connected anymore, exiting"
  exit 1
}

graceful_exit() {
  echo "received exit request, disconnecting and exiting"
  disconnect
  exit 0
}

trap graceful_exit SIGTERM SIGABRT INT

connect
monitor_connection
```

## usage
```bash
sudo systemctl start bluetooth-device@DEVICE_MAC_ADDR
sudo systemctl status bluetooth-device@DEVICE_MAC_ADDR
```
