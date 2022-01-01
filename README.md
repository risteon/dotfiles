Install notes for Ubuntu 18.04
=========

This repo primarily provides a configuration for tmux, vim, zsh, powerline, rxvt-unicode and i3.
It is recommended to clone it to a folder $HOME/dotfiles.

**Bootstrap**
```
$ git clone https://github.com/risteon/dotfiles.git $HOME/dotfiles
$ cd dotfiles/script
$ ./bootstrap
```

Tools and Dependencies
----------------

### Dependencies (apt)
 * zsh
 * tmux
 * vim-gnome (huge vim version including python3 support, else see building VIM from source)
 * socat (for powerline)
 * xautomation
 * xbindkeys
 * URxvt terminal emulator
 * feh, nitrogen
 * xbacklight
 * shutter
 * dmenu
 * rofi
 * libiw-dev
 * redshift

```
$ sudo apt-get install zsh tmux vim-gnome socat rxvt-unicode-256color xautomation xbindkeys feh nitrogen xbacklight shutter xautomation xbindkeys suckless-tools libiw-dev
```

### Dependencies (PyPI)

 * powerline-status
 * powerline-gitstatus
 * thefuck
 * i3pystatus
 * i3-py
 * netifaces
 * basiciw
 * psutil
 * colour
 * autorandr

```
$ sudo pip3 install powerline-status powerline-gitstatus thefuck i3pystatus i3-py quickswitch-i3 netifaces basiciw psutil colour
$ pip3 install --user autorandr
```

### Clone Tmux Plugin Manager
```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Hit Prefix+I in tmux to install tmux-resurrect and any other plugins specified in .tmux.conf

### VIM Plugins: Vundle
Launch vim and run :PluginInstall

YouCompleteMe: see https://github.com/Valloric/YouCompleteMe

Compile YCM: Make sure python-dev is installed

```
$ sudo apt-get install python-dev
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.py --clang-completer
```

### Picom

Build and install picom according to https://github.com/yshui/picom.

### Polybar

Download release (tested 3.5.7) and build https://github.com/polybar/polybar/wiki/Compiling.

### Alacritty

Build from source.

### i3-gaps

On Ubuntu 18.04, install from PPA https://launchpad.net/~regolith-linux/+archive/ubuntu/release.

### rxvt-unicode with wide glyph support
```
git clone https://github.com/blueyed/rxvt-unicode.git
cd rxvt-unicode
./configure --prefix=/usr --enable-everything --enable-256-color --disable-perl
```

# [Legacy] i3_config

Configuration files and install notes for the i3 window manager and additonal programs. For Ubuntu 16.04. Xenial.

Install distro packages 
-----------------------
  * (feh)
  * nitrogen
  * xbacklight
  * Screenshots: shutter
  * playerctl https://github.com/acrisci/playerctl
  * mouse buttons remapping: xautomation, xbindkeys
  * dmenu (suckless-tools)
  * libiw-dev for Pip basiciw
```
sudo apt-get install feh nitrogen xbacklight shutter xautomation xbindkeys suckless-tools libiw-dev
```

PyPi packages for i3pystatus
----------------------------
Install for Python 3.

  * i3pystatus
  * netifaces
  * basiciw
  * psutil
  * colour

basiciw needs libiw.

Quickswitch.py
--------------
See https://github.com/proxypoke/quickswitch-for-i3
```
sudo pip3 install i3-py quickswitch-i3
```

Appearance (GTK2/3)
---------------
```
sudo apt-get install lxappearance gtk-chtheme qt4-qtconfig
```
Change to new GTK-theme in lxappearance, gtk-chtheme, and qtconfig-qt4.
Install a GTK-theme, for example:
```
sudo apt-add-repository ppa:tista/adapta -y  
sudo apt update  
sudo apt install adapta-gtk-theme
```

Prevent Nemo file browser from spawning a desktop window
---------------
```
gsettings set org.nemo.desktop show-desktop-icons false
```
