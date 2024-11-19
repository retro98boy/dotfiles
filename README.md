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

```
sudo apt install zsh
```

or

手动下载最新的[源码](https://github.com/zsh-users/zsh)编译安装

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

## 应用配置

```
ln -svf ~/dotfiles/zsh/.zshrc ~; \
sh ~/dotfiles/zsh/install_plugins.sh
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

```
sudo apt install neovim
```

or

手动下载最新的[源码](https://github.com/neovim/neovim)编译安装

```
# 安装依赖和工具
sudo apt install pkg-config libtool-bin gettext gcc make cmake unzip git
# 编译并安装
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr/local -j12
sudo make install
```

## 应用配置

```
ln -svf ~/dotfiles/nvim ~/.config
```

# clangd

## 应用配置

```
ln -svf ~/dotfiles/clangd ~/.config
```

# kitty

## 安装kitty

ArchLinux：

```
sudo pacman -S kitty
```

Ubuntu：

```
sudo apt install kitty
```

or

从kitty的[github](https://github.com/kovidgoyal/kitty)的Releases界面下载最新的`Linux amd64 binary bundle`，解压到~/.local或者/usr/local

## 应用配置

```
ln -svf ~/dotfiles/kitty ~/.config
```

# wezterm

## 安装wezterm

ArchLinux：

```
sudo pacman -S wezterm
```

Ubuntu：

从wezterm的[github](https://github.com/wez/wezterm)的Releases界面下载最新的deb手动安装

## 应用配置

```
ln -svf ~/dotfiles/wezterm ~/.config
```

# hyprland

## 安装hyprland及其它工具

ArchLinux：

```
sudo pacman -S hyprland hyprlock hypridle xdg-desktop-portal-hyprland

sudo pacman -S wofi waybar swaync swww \
nwg-look brightnessctl pamixer pavucontrol wireplumber network-manager-applet blueman \
fcitx5-im fcitx5-rime wl-clipboard \
polkit-gnome \
ttf-jetbrains-mono-nerd

sudo pacman -S nautilus nautilus-checksums nautilus-image-converter nautilus-metadata-editor nautilus-share gvfs-smb gvfs-nfs gvfs-mtp file-roller \
kitty
paru -S nautilus-open-any-terminal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
```

## 应用配置

```
ln -svf ~/dotfiles/hyprland/hypr ~/.config; \
ln -svf ~/dotfiles/hyprland/wofi ~/.config; \
ln -svf ~/dotfiles/hyprland/swaync ~/.config; \
ln -svf ~/dotfiles/hyprland/waybar ~/.config
```

swaync配置来自[JaKooLit/Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots)

waybar配置基于[JaKooLit/Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots)
