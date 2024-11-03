#!/bin/bash
set -euxo pipefail

# ctrl と capslock 入れ替え
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"

# 

# apt
sudo apt update

apt_packages=(
    git
    autokey-gtk
    ibus-mozc
    mozc-utils-gui
)
sudo apt install --no-upgrade -y "${apt_packages[@]}"

# snap
snap_packages=(
    vivaldi
    vscode
)

# snap 各パッケージをインストール
for package in "${snap_packages[@]}"; do
    if snap list | grep -q "^$package"; then
        echo "$package は既にインストールされています。"
    else
        echo "$package をインストールしています..."
        sudo snap install "$package"
    fi
done

ibus restart 