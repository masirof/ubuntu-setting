#!/bin/bash
set -euxo pipefail

# ctrl と capslock 入れ替え
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"

# apt
sudo apt update

apt_packages=(
    git
    autokey-gtk
    ibus-mozc
    mozc-utils-gui
)
sudo apt install --no-upgrade -y "${apt_packages[@]}"

# デフォルトだとsnapのインストール速度が遅い
echo "151.101.62.217  fastly.cdn.snapcraft.io" | sudo sh -c 'cat >> /etc/hosts'

# snap
snap_packages=(
    vivaldi
)
sudo snap install "${snap_packages[@]}"

sudo snap install vscode --classic

ibus restart