Set pdf to system handler. 

Setup [hardware acceleration for fedora](https://fedoraproject.org/wiki/Firefox_Hardware_acceleration)

## about:config

```
widget.wayland.fractional-scale.enabled=true
```

## work profile desktop shortcut

`.local/share/applications/firefoxwork.desktop`
```
[Desktop Entry]
Version=1.0
Name=Firefox Work
GenericName=Web Browser
Comment=Browse the Web
Exec=firefox -P work
Icon=firefox
Terminal=false
Type=Application
StartupNotify=true
Categories=Network;WebBrowser;
Keywords=web;browser;internet;
Actions=new-window;new-private-window;profile-manager-window;

X-Desktop-File-Install-Version=0.26
```
