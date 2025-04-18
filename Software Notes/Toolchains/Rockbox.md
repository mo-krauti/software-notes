## dev setup

Tested with ubuntu 22.04

### clone
```bash
git clone git://git.rockbox.org/rockbox
```

### compile cross compiler
```bash
sudo apt install -y automake bison build-essential ccache flex libc6-dev libgmp3-dev libmpfr-dev libsdl1.2-dev libtool-bin texinfo zip gawk wget libmpc-dev gettext libsdl1.2-compat-dev
cd rockbox/tools/
sudo ./rockboxdev.sh
```

### compile
```bash
cd rockbox/
mkdir build && cd build
../tools/configure
make -j
```

### compile simulator
```bash
cd rockbox/
mkdir build-simulator && cd build-simulator
../tools/configure
# choose simulator target
make -j
make fullinstall
./rockboxui
```
