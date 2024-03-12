#!/bin/bash

ZSH_PLUGIN_PATH=$HOME/.local/share/zsh/plugins
mkdir -p $ZSH_PLUGIN_PATH && cd $ZSH_PLUGIN_PATH

rm -rf zsh-completions zsh-autosuggestions fast-syntax-highlighting zsh-history-substring-search sudo

git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git

mkdir -p ./sudo && \
wget "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh" -O ./sudo/sudo.plugin.zsh
