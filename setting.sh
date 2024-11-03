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
entry="151.101.62.217  fastly.cdn.snapcraft.io"

# すでにエントリが存在するか確認
if grep -qF "$entry" /etc/hosts; then
    echo "エントリはすでに存在します: $entry"
else
    echo "$entry" | sudo sh -c 'cat >> /etc/hosts'
    echo "エントリが追加されました。"
fi

# snap
snap_packages=(
    vivaldi
)
sudo snap install "${snap_packages[@]}"

sudo snap install code --classic

ibus restart