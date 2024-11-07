#!/bin/bash
set -euxo pipefail

git clone https://github.com/masirof/my_autokey/ ~/.config/autokey/data/keyremap/

# wget -nH --cut-dirs=4 -r --no-parent \
# https://github.com/deep-learning-with-pytorch/dlwpt-code/tree/master/data/ (-P ./<dir_name>/)

# wget -nH --cut-dirs=4 -r --no-parent https://github.com/masirof/my_autokey/tree/main/keyremap (-P ./<dir_name>/)

# wget -nH --cut-dirs=4 -r --no-parent https://github.com/masirof/my_autokey/tree/main/keyremap/

# wget -r --no-parent http://domain.com/any/directory/with/files

# wget -r --no-parent https://raw.githubusercontent.com/masirof/my_autokey/refs/heads/main/keyremap/