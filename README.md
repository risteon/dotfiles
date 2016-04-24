Install notes for ubuntu 16.04
=========

dotfiles for tmux2.1/python3/zsh/powerline setup

Tested with gnome-terminal/konsole.


Install packages:
----------------
  * zsh
  * tmux
  * vim-gnome (huge vim version including python3 support, else see building VIM from source)
  * python3-pip
  * socat (for powerline)
```
$ sudo apt-get install zsh tmux vim-gnome python3-pip socat
```

Create dotfile symlinks
-----------------------
Move any previous config files to a backup location!

```
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.pythonrc ~/.pythonrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

Clone oh-my-zsh:
----------------
```
$ git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

Install FASD for zsh
-----------
```
$ git clone git@github.com:clvv/fasd.git ~/workspace/fasd
$ cd fasd
$ sudo make install
```

Powerline Python package:
----------------
```
$ sudo -H pip3 install powerline-status
```

Powerline fonts
--------------
e.g. Liberation Mono for powerline
Run install.sh to copy all fonts, choose font in terminal emulator of your choice

```
$ git clone git@github.com:powerline/fonts.git ~/workspace/powerline_fonts
$ ~/workspace/powerline_fonts/install.sh
```

Clone Tmux Plugin Manager
------------------------
```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Hit Prefix+I in tmux to install tmux-resurrect and any other plugins specified in .tmux.conf


VIM Plugins: Vundle
-------------------
Launch vim and run :PluginInstall
YouCompleteMe: see https://github.com/Valloric/YouCompleteMe
Compile YCM:
Make sure python-dev is installed

```
$ sudo apt-get install python-dev
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.py --clang-completer
```

Optional: Build VIM with Python 3 support from source
-------------------------------
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

