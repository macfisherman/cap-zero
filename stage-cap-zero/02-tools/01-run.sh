#!/bin/bash -e


on_chroot <<EOF
mkdir -p tool/bully
cd tool/bully
wget https://github.com/wiire-a/bully/archive/master.zip
unzip master.zip
cd bully-master/src
make
make install
cd ../../../..
mkdir tool/bettercap
cd tool/bettercap
wget https://github.com/bettercap/bettercap/releases/download/v2.26.1/bettercap_linux_armhf_v2.26.1.zip
unzip bettercap_linux_armhf_v2.26.1.zip
install -m 0755 bettercap /usr/sbin
wget https://github.com/bettercap/caplets/archive/master.zip
unzip master.zip
mkdir -p /usr/local/share/bettercap/caplets
cp -r caplets-master/* /usr/local/share/bettercap/caplets
ls -ld /usr/local/share/bettercap/caplets
EOF
