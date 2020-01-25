#!/bin/bash -e

#on_chroot << EOF
#systemctl stop dnsmasq
#systemctl stop hostapd
#EOF

cat >> "${ROOTFS_DIR}/etc/dhcpcd.conf"<<EOF
interface wlan0
    static ip_address=192.168.4.1/24
    static routers=192.168.4.1
    static domain_name_servers=192.168.4.1
    nohook wpa_supplicant
EOF

#on_chroot << EOF
#service dhcpcd restart
#EOF

install -m 0644 -b files/dnsmasq.conf "${ROOTFS_DIR}/etc/"

#on_chroot << EOF
#systemctl reload dnsmasq
#EOF

install -m 0644 -b files/hostapd.conf "${ROOTFS_DIR}/etc/hostapd/"

#cat >> "${ROOTFS_DIR}/etc/default/hostapd" <<EOF
#DAEMON_CONF="/etc/hostapd/hostapd.conf"
#EOF

on_chroot << EOF
systemctl unmask hostapd
systemctl enable hostapd
systemctl start hostapd
EOF

