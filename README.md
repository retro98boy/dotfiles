```
cd ~ && git clone https://github.com/retro98boy/dotfiles.git
```

# zsh

## 安装zsh

ArchLinux：

```
sudo pacman -S zsh
```

Termux：

```
apt install zsh
```

Ubuntu：
如果官方维护的zsh版本低，手动下载最新的[源码](https://github.com/zsh-users/zsh)编译安装

```
# 安装依赖和工具
# cursesw = curses + utf-8支持
sudo apt install libncursesw5-dev autoconf gcc make cmake
# 编译并安装
./Util/preconfig
./configure --prefix=/usr/local
make -j12
make check
sudo make install
```

## 安装本配置所需软件

ArchLinux：

```
sudo pacman -S thefuck wget git
```

Termux：
thefuck在Termux上需要sudo才能使用，故弃用，注释.zshrc中相关行即可

```
apt install wget git
```

Ubuntu：

```
sudo apt install thefuck wget git
```

## 应用配置

```
ln -svf ~/dotfiles/zsh_as_shell/.zshrc ~/.zshrc
ln -svf ~/dotfiles/zsh_as_shell/.local/share/zsh ~/.local/share/zsh
cd ~/.local/share/zsh/plugins && sh plugins_update.sh && cd ~
```

# nvim

## 安装nvim

ArchLinux：

```
sudo pacman -S neovim
```

Termux：

```
apt install neovim
```

Ubuntu：
如果官方维护的Neovim版本低，手动下载最新的[源码](https://github.com/neovim/neovim)编译安装

```
# 安装依赖和工具
sudo apt install pkg-config libtool-bin gettext gcc make cmake
# 编译并安装
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr/local -j12
sudo make install
```

## 安装本配置所需软件

ArchLinux：

```
sudo pacman -S tree-sitter nodejs npm git curl wget unzip-natspec tar gzip ripgrep make cmake
```

Termux：

```
apt install rust binutils
# 将~/.cargo/bin加到$PATH中
cargo install tree-sitter-cli
apt install nodejs git curl wget unzip tar gzip ripgrep make cmake
```

Ubuntu：

```
sudo apt install cargo
# 将~/.cargo/bin加到$PATH中
cargo install tree-sitter-cli
sudo apt install nodejs npm git curl wget unzip tar gzip ripgrep make cmake
```

## 应用配置

```
ln -svf ~/dotfiles/nvim_as_ide/.config/nvim ~/.config/nvim
```

# kitty

## 安装kitty

ArchLinux：

```
sudo pacman -S kitty
```

## 应用配置

```
ln -svf ~/dotfiles/kitty_as_terminal/.config/kitty ~/.config/kitty
```
