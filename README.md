# 一些依赖

zsh neovim kitty

thefuck tree-sitter nodejs npm git curl wget unzip tar gzip ripgrep make cmake

以及nerd字体

ArchLinux：

```
sudo pacman -S zsh neovim kitty
sudo pacman -S thefuck tree-sitter nodejs npm git curl wget unzip-natspec tar gzip ripgrep make cmake
```

Ubuntu：

```
# Neovim建议去官方github界面下载最新版的deb包安装
sudo apt install zsh kitty
# 低版本的Ubuntu没有tree-sitter包，可以去官方github下载二进制包手动放到$PATH中
sudo apt install thefuck nodejs npm git curl wget unzip tar gzip ripgrep make cmake
```

Termux：

```
apt install zsh neovim
# thefuck在Termux上需要sudo才能使用，故弃用，注释.zshrc中相关行即可
apt install nodejs git curl wget unzip tar gzip ripgrep make cmake
# tree-sitter，将~/.cargo/bin加到$PATH中
apt install rust binutils
cargo install tree-sitter-cli
```

# 应用配置

cd ~ && git clone https://github.com/retro98boy/dotfiles.git

## zsh

ln -svf ~/dotfiles/zsh_as_shell/.zshrc ~/.zshrc

ln -svf ~/dotfiles/zsh_as_shell/.local/share/zsh ~/.local/share/zsh

cd ~/.local/share/zsh/plugins && sh plugins_update.sh && cd ~

## nvim

ln -svf ~/dotfiles/nvim_as_ide/.config/nvim ~/.config/nvim

## kitty

ln -svf ~/dotfiles/kitty_as_terminal/.config/kitty ~/.config/kitty
