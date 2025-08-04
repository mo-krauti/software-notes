## Installation 

Tested on Fedora 42

```bash
git clone https://github.com/bkerler/edl.git # do NOT use --recurse-submodules
cd edl
# the newest version did not work with my nokia 6300 4G
git checkout 3.0
git submodule update --init --recursive
chmod +x ./install-linux-edl-drivers.sh
sudo ./install-linux-edl-drivers.sh
```

Python 3.13 was to new. Start ubuntu 20.04 in [[distrobox]] and continue there.

```bash
sudo apt install adb fastboot python3-dev python3-pip liblzma-dev git
pip install -r requirements.txt
```
