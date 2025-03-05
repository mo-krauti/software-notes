# setup

## fonts
1. Download SauceCodePro
2. Extract
3. `chmod 755 SourceCodePro`
4. copy to `/usr/share/fonts` ## ssh ```fish
systemctl --user enable --now ssh-agent
```

## fido2
See [here](https://fedoramagazine.org/use-systemd-cryptenroll-with-fido-u2f-or-tpm2-to-decrypt-your-disk/)

## pdf
```fish
sudo dnf install zathura-pdf-poppler
xdg-mime default zathura.desktop application/pdf
```


## firefox

Set pdf to system handler. 

Setup [hardware acceleration](https://fedoraproject.org/wiki/Firefox_Hardware_acceleration)
