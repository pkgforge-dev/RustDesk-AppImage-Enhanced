#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm pipewire-audio pipewire-jack

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano intel-media-driver-mini

if [ "$ARCH" = 'x86_64' ]; then
	pacman -S --noconfirm libva-intel-driver
fi

# Comment this out if you need an AUR package
make-aur-package rustdesk

# If the application needs to be manually built that has to be done down here
