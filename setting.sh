#!/bin/bash
set -euxo pipefail

# ctrl と capslock 入れ替え
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"

# ❗mozc ctrl+spaceの設定

# apt
sudo apt update

apt_packages=(
    git
    autokey-gtk
    autokey-qt
    ibus-mozc
    mozc-utils-gui
)
sudo apt install --no-upgrade -y "${apt_packages[@]}"

# vivaldi install
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/vivaldi-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vivaldi-archive-keyring.gpg] https://repo.vivaldi.com/archive/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list

# vscode install
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update

sudo apt install --no-upgrade -y vivaldi-stable
sudo apt install --no-upgrade -y code

# キーボードの設定をkeydでしてみる
# https://harenuma.hatenablog.com/entry/2023/12/14/073830
# sudo apt install make 
# sudo apt install -y build-essential
# git clone https://github.com/rvaiya/keyd ~/Documents/Github/
# cd ~/Documents/Github/keyd/
# make && sudo make install
# sudo systemctl enable keyd && sudo systemctl start keyd


# sudo apt remove autokey-qt
# sudo snap remove vivaldi code

# # デフォルトだとsnapのインストール速度が遅い
# entry="151.101.62.217  fastly.cdn.snapcraft.io"

# # すでにエントリが存在するか確認
# if grep -qF "$entry" /etc/hosts; then
#     echo "エントリはすでに存在します: $entry"
# else
#     echo "$entry" | sudo sh -c 'cat >> /etc/hosts'
#     echo "エントリが追加されました。"
# fi

# # snap
# snap_packages=(
#     vivaldi
# )
# sudo snap install "${snap_packages[@]}"

# sudo snap install code --classic

