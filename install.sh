#!/bin/bash

set -e

curl 'http://releases.obins.net/occ/linux/deb/ObinslabStarter_1.0.7.deb' > os.deb
ar vx os.deb data.tar.xz
rm os.deb

tar xf data.tar.xz
rm data.tar.xz

sudo cp ./obinslab-starter.rules /etc/udev/rules.d/
sudo udevadm control --reload-rule

sudo cp -r ./opt/Obinslab\ Starter /opt
sudo cp -r ./usr/share /usr

rm -rf opt usr
