Install notes for Ubuntu 17.04
=========

This repo primarily provides a configuration for tmux, vim, zsh and powerline.
I recommend to clone it to a folder $HOME/dotfiles.

Make sure to checkout submodules:
```
$ git submodule update --init --recursive
$ cd ~/dotfiles/script
$ ./bootstrap
```

Clone powerlevel9k theme to oh-my-zsh (currently unused)
```
git clone https://github.com/bhilburn/powerlevel9k.git $HOME/dotfiles/oh-my-zsh/custom/themes/powerlevel9k
```

### Symlink powerline config
```
$ ln -s ~/dotfiles/config/powerline ~/.config/powerline
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
  * xautomation
  * xbindkeys
```
$ sudo apt-get install zsh tmux vim-gnome python3-pip socat rxvt-unicode-256color xautomation xbindkeys
```

### Pip

```
$ pip3 install thefuck
```

### Powerline Python package:
```
$ sudo -H pip3 install powerline-status
$ sudo -H pip3 install powerline-gitstatus
$ ln -s ~/dotfiles/config/powerline ~/.config/powerline

```

### Nerd Fonts (Powerline Fonts)
e.g. Sauce Code Pro Nerd Font. Choose font in terminal emulator of your choice.

```
$ git clone https://github.com/ryanoasis/nerd-fonts.git
$ ./nerd-fonts/install.sh ShareTechMono
```

### Clone Tmux Plugin Manager
```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Hit Prefix+I in tmux to install tmux-resurrect and any other plugins specified in .tmux.conf


### VIM: Backup folders
Create folders for vim backup files
```
$ mkdir ~/.vimtmp
$ mkdir ~/.vimbackup
```

### VIM Plugins: Vundle
Launch vim and run :PluginInstall

YouCompleteMe: see https://github.com/Valloric/YouCompleteMe

Compile YCM: Make sure python-dev is installed

```
$ sudo apt-get install python-dev
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.py --clang-completer
```

### Git configuration
Set global .gitignore
```
git config --global core.excludesfile ~/dotfiles/gitignore_global
```

### rxvt-unicode with wide glyph support
```
git clone https://github.com/blueyed/rxvt-unicode.git
cd rxvt-unicode
./configure --prefix=/usr --enable-everything --enable-256-color --disable-perl
```

