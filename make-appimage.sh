#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q rustdesk | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/256x256/apps/rustdesk.png
export DESKTOP=/usr/share/applications/rustdesk.desktop
export DEPLOY_PIPEWIRE=1
export DEPLOY_GSTREAMER=1

# Deploy dependencies
quick-sharun /usr/bin/rustdesk

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
