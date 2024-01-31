#!/usr/bin/env bash

echo "1. Setup repo."
printf "[qeusOS]\nSigLevel = Optional TrustAll\nServer = https://github.com/qeusOS/pkgs/raw/main/$arch\n" >> /etc/pacman.conf

sudo pacman -Syu --noconfirm --needed

if ! [ -d /etc/qeusos ]; then
				mkdir /etc/qeusos
fi

pacman -S \
				vim \
				arch-install-scripts \
				gpm \
				f2fs-tools \
				links \
				sof-firmware \
				xorg xorg-xinit xorg-server \
				vim \
				yay \
				--noconfirm --needed

pacman -Qq > /etc/qeusos/pkgs.conf

git clone https://github.com/qeusOS/qeusOS /tmp/qeusOS

if ! [ -d /usr/local/bin ]; then
				mkdir /usr/local/bin
fi

cp -r /tmp/qeusOS/scripts/* /usr/local/bin
