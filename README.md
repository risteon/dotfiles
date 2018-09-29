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

Clone powerlevel9k theme to oh-my-zsh (currently unused)
```
git clone https://github.com/bhilburn/powerlevel9k.git $HOME/dotfiles/oh-my-zsh/custom/themes/powerlevel9k
```

Dependencies
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
 * libiw-dev

```
$ sudo apt-get install zsh tmux vim-gnome socat rxvt-unicode-256color xautomation xbindkeys feh nitrogen xbacklight shutter xautomation xbindkeys suckless-tools libiw-dev
```

### Dependencies (PyPI)

 * powerline-status
 * powerline-gitstatus
 * thefuck
 * i3pystatus
 * i3-py
 * quickswitch-i3
 * netifaces
 * basiciw
 * psutil
 * colour

```
$ sudo pip3 install powerline-status powerline-gitstatus thefuck i3pystatus i3-py quickswitch-i3 netifaces basiciw psutil colour
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

### rxvt-unicode with wide glyph support
```
git clone https://github.com/blueyed/rxvt-unicode.git
cd rxvt-unicode
./configure --prefix=/usr --enable-everything --enable-256-color --disable-perl
```

