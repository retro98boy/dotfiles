cd ~
git clone this
## zsh
ln -svf ~/dotfiles/zsh_as_shell/.zshrc ~/.zshrc
ln -svf ~/dotfiles/zsh_as_shell/.local/share/zsh ~/.local/share/zsh
pushd ~/.local/share/zsh/plugins && sh plugins_update.sh && popd
## nvim
ln -svf ~/dotfiles/nvim_as_ide/.config/nvim ~/.config/nvim
