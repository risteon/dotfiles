Install notes for Ubuntu 16.04
=========

This repo primarily provides a configuration for tmux, vim, zsh and powerline.

Make sure to checkout submodules:
```
$ git submodule update --init --recursive
```

### Create symlinks in your home directory
```
$ ln -s ~/dotfiles/.vimrc ~/dotfiles/.vim ~/dotfiles/.bashrc ~/dotfiles/.zshrc ~/dotfiles/.pythonrc ~/dotfiles/.tmux.conf ~/dotfiles/.Xresources ~/dotfiles/.Xresources.d ~
```

Software and dependencies
----------------

### Install via apt:
  * zsh
  * tmux
  * vim-gnome (huge vim version including python3 support, else see building VIM from source)
  * python3-pip
  * socat (for powerline)
  * URxvt terminal emulator
```
$ sudo apt-get install zsh tmux vim-gnome python3-pip socat rxvt-unicode-256color
```

### Install FASD for zsh:
```
$ git clone git@github.com:clvv/fasd.git ~/fasd
$ cd ~/fasd
$ sudo make install
```

### Powerline Python package:
```
$ sudo -H pip3 install powerline-status
$ sudo -H pip3 install powerline-gitstatus
$ ln -s ~/dotfiles/config/powerline ~/.config/powerline

```

### Powerline fonts
e.g. Liberation Mono for powerline. Run install.sh to copy all fonts, then choose font in terminal emulator of your choice.

```
$ git clone git@github.com:powerline/fonts.git ~/powerline_fonts
$ ~/powerline_fonts/install.sh
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

### Optional: Build VIM with Python 3 support from source
Prerequisites:

```
$ sudo apt-get install checkinstall mercurial python-dev python3-dev ruby ruby-dev libx11-dev libxt-dev libgtk2.0-dev libncurses5 ncurses-dev
```
Build VIM from source:
```
$ hg clone https://vim.googlecode.com/hg/ ~/workspace/vim
$ cd ~/workspace/vim
$ ./configure \
--enable-perlinterp \
--enable-python3interp \
--enable-rubyinterp \
--enable-cscope \
--enable-gui=auto \
--enable-gtk2-check \
--enable-gnome-check \
--with-features=huge \
--enable-multibyte \
--with-x \
--with-compiledby="xorpd" \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
--prefix=/opt/vim74
$ make
$ make test
$ sudo checkinstall
```

Link python3 version
```
$ sudo ln -s /opt/vim74/bin/vim /usr/local/bin/vim
```

