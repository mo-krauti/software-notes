# cups network printer
make a usb printer network accessible

## printer
```bash
sudo apt install -y cups
sudo apt install -y hpijs-ppds
sudo usermod -a -G lpadmin mo
sudo cupsctl --remote-any
```
Now setup the printer at `http://ip:631` with the correct driver and select `Share this printer`.

## scanner
```bash
sudo apt install -y libsane sane-utils
sudo apt install -y libsane-hpaio
```

Setup [AirSane](https://github.com/SimulPiscator/AirSane)
