#!/usr/bin/fish

pushd /run/media/mo/bootfs/
touch ssh

read -P 'user name: ' RASPI_USER
read -P 'user pw: ' RASPI_PASSWORD
echo $RASPI_PASSWORD | openssl passwd -6 -stdin | awk '{print "'$RASPI_USER':" $0}' > userconf.txt
popd

set -x NMCONNECTION_FILE_LOCATION /run/media/mo/rootfs/etc/NetworkManager/system-connections/MOPRECONFIGURED.nmconnection
sudo cp MOPRECONFIGURED.nmconnection $NMCONNECTION_FILE_LOCATION
sudo nvim $NMCONNECTION_FILE_LOCATION
sudo chmod -R 600 $NMCONNECTION_FILE_LOCATION
sudo chown -R root:root $NMCONNECTION_FILE_LOCATION
