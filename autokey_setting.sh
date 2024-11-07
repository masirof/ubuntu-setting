#!/bin/bash
set -euxo pipefail

wget -P ~/.config/autokey/data/ https://github.com/masirof/my_autokey/archive/refs/heads/main.tar.gz
tar -C ~/.config/autokey/data/ -xvf ~/.config/autokey/data/main.tar.gz --strip-components 1
rm README.md
rm main.tar.gz

pkill autokey-gtk
nohup autokey-gtk &



# git clone https://github.com/masirof/my_autokey/ ~/.config/autokey/data/keyremap/
# git clone --separate-git-dir=~/.config/autokey/data/.git https://github.com/masirof/my_autokey/ ~/.config/autokey/data/

# wget -nH --cut-dirs=4 -r --no-parent \
# https://github.com/deep-learning-with-pytorch/dlwpt-code/tree/master/data/ (-P ./<dir_name>/)

# wget -nH --cut-dirs=4 -r --no-parent https://github.com/masirof/my_autokey/tree/main/keyremap (-P ./<dir_name>/)

# wget -nH --cut-dirs=4 -r --no-parent https://github.com/masirof/my_autokey/tree/main/keyremap/

# wget -r --no-parent http://domain.com/any/directory/with/files

# wget -r --no-parent https://raw.githubusercontent.com/masirof/my_autokey/refs/heads/main/keyremap/