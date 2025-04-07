# setup

## fonts
1. Download SauceCodePro
2. Extract
3. `chmod 755 SourceCodePro`
4. copy to `/usr/share/fonts`


## ssh
```fish
systemctl --user enable --now ssh-agent
```

## automatic disk mounting as user
```fish
systemctl --user enable --now udiskie
```

## fido2
See [here](https://fedoramagazine.org/use-systemd-cryptenroll-with-fido-u2f-or-tpm2-to-decrypt-your-disk/)

## pdf
```fish
sudo dnf install zathura-pdf-poppler
xdg-mime default zathura.desktop application/pdf
```

## thinkpad docking stations
Install [displaylink-rpm](https://github.com/displaylink-rpm/displaylink-rpm)
