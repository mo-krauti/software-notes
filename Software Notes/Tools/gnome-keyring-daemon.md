It is started via dbus, which is configured in `/usr/share/dbus-1/services/org.freedesktop.secrets.service`
to

```
[D-BUS Service]
Name=org.freedesktop.secrets
Exec=/usr/bin/gnome-keyring-daemon --start --foreground --components=secrets
```

To use keepassxc as the secret service provider, add into `~/.local/share/dbus-1/services/org.freedesktop.secrets.service`:

```
[D-BUS Service]
Name=org.freedesktop.secrets
Exec=/usr/bin/keepassxc
```

* https://github.com/keepassxreboot/keepassxc/issues/6274  
* https://gitlab.gnome.org/GNOME/gnome-keyring/-/issues/86
