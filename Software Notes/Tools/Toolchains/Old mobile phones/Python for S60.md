We will need to run python 2.5, so we will install ubuntu-8.04 hardy in a VM which contains this version. 
Tested on Fedora 42.

## Ubuntu 8.04 VM setup

Edit `/etc/libvirt/network.conf` and set `firewall_backend = "iptables"`

```bash
wget https://old-releases.ubuntu.com/releases/8.04.0/ubuntu-8.04.4-server-amd64.iso
systemctl start virtnetworkd
virt-install --name ubuntu-8.04-server --memory 4000 --noreboot \
                                              --os-variant detect=on,name=ubuntuhardy \
                                              --disk=size=10,backing_store="$(pwd)/ubuntu-8.04.4-server-amd64.iso" \
                                              --network bridge=virbr0
```
Click through the installer using `virt-viewer` and enable ssh. Login using the console and find out the ip.  
Add to your `~/.ssh/config`:
```
Host ubuntu-hardy-vm
    HostName 192.168.122.136
    User ubuntu
    PubkeyAcceptedAlgorithms +ssh-rsa
    HostkeyAlgorithms +ssh-rsa
    SetEnv TERM=xterm
```
[Enable legacy openssl policies](https://serverfault.com/questions/1125843/error-in-libcrypto-connecting-rhel-9-server-to-centos-6-via-sftp-ssh) (required for Fedora >= 41).

Add public key to vm:
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu-hardy-vm
```
Replace `/etc/apt/sources.list` with
```
deb http://old-releases.ubuntu.com/ubuntu hardy main multiverse restricted universe
deb http://old-releases.ubuntu.com/ubuntu hardy-backports main multiverse restricted universe
deb http://old-releases.ubuntu.com/ubuntu hardy-proposed main multiverse restricted universe
deb http://old-releases.ubuntu.com/ubuntu hardy-security main multiverse restricted universe
deb http://old-releases.ubuntu.com/ubuntu hardy-updates main multiverse restricted universe
```
Install openssl
```bash
sudo apt-get update
sudo apt-get install openssl
```

## ensymble setup

Download `PythonForS60_2.0.0.tar.gz` from https://web.archive.org/web/20231208115724/https://garage.maemo.org/frs/?group_id=854&release_id=3264  
Extract and copy to vm:
```
tar -xvf PythonForS60_2.0.0.tar.gz
scp -r PythonForS60/ ubuntu-hardy-vm:
```

## example build

```bash
mkdir hello-world-app
cd hello-world-app
echo 'print "Hello world!"' > default.py
scp -r . ubuntu-hardy-vm:PythonForS60
ssh ubuntu-hardy-vm 'cd PythonForS60 && python ensymble.py py2sis hello-world-app'
scp ubuntu-hardy-vm:PythonForS60/hello-world-app_v1_0_0.sis .
```

## run app on phone

Install the necessary libs and python interpreter `.sis` packages first. Then install and run your app.

## PC Simulator

```bash
apt-get install python-wxgtk2.6 python-qt4 xauth
```
