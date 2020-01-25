#!/bin/bash -e

on_chroot <<EOF
curl -s https://packagecloud.io/install/repositories/aircrack-ng/release/script.deb.sh | bash
EOF
