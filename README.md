```
cd ~ && git clone https://github.com/retro98boy/dotfiles.git
```

# Zsh

## 安装Zsh

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
make -j$(nproc)
make check
sudo make install
```

## 应用配置

```
ln -svf ~/dotfiles/zsh/.zshrc ~; \
sh ~/dotfiles/zsh/install-plugins.sh
```

# Neovim

## 安装Neovim

ArchLinux：

```
sudo pacman -S neovim
```

Termux：

```
apt install neovim
```

Ubuntu：

手动下载最新的[源码](https://github.com/neovim/neovim)编译安装

```
# 安装依赖和工具
sudo apt install pkg-config libtool-bin gettext gcc make cmake unzip git
# 编译并安装
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr/local -j$(nproc)
sudo make install
```

## 应用配置

```
ln -svf ~/dotfiles/nvim ~/.config
```

# kitty

## 安装kitty

ArchLinux：

```
sudo pacman -S kitty
```

## 应用配置

```
ln -svf ~/dotfiles/kitty ~/.config
```

# Ghostty

## 安装Ghostty

ArchLinux：

```
sudo pacman -S ghostty
```

## 应用配置

```
ln -svf ~/dotfiles/ghostty ~/.config
```

# Windows Terminal

## 安装Windows Terminal

从[此处](https://github.com/microsoft/terminal/releases)下载安装包安装即可

## 应用配置

将`dotfiles/windows-terminal`下的文件全部复制到`%USERPROFILE%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState`即可

# Niri

## 安装Niri及其它工具

ArchLinux：

```
sudo pacman -S niri xwayland-satellite xdg-desktop-portal-gtk xdg-desktop-portal-gnome gnome-keyring polkit-gnome

sudo pacman -S wofi waybar swaync swww \
nwg-look brightnessctl pamixer pavucontrol wireplumber network-manager-applet blueman \
fcitx5-im fcitx5-rime wl-clipboard \
ttf-jetbrains-mono-nerd

sudo pacman -S nautilus nautilus-checksums nautilus-image-converter nautilus-metadata-editor nautilus-share gvfs-smb gvfs-nfs gvfs-mtp file-roller \
kitty archlinuxcn/nautilus-open-any-terminal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
```

## 应用配置

```
ln -svf ~/dotfiles/niri ~/.config; \
ln -svf ~/dotfiles/wofi ~/.config; \
ln -svf ~/dotfiles/waybar ~/.config
```
