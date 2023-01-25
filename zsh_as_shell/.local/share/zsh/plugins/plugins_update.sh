#!/bin/bash
rm -rf zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search pure sudo

git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git
git clone https://github.com/sindresorhus/pure.git

mkdir -p ./sudo && \
wget "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh" -O ./sudo/sudo.plugin.zsh
