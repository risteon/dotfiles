dotfiles
========

powerline for use with zsh, vim and tmux up-to-date.
powerline prompt in zsh

Install packages:
----------------
  * tmux
  * vim
  * python-pip (for powerline)
  * socat (for powerline)

Python packages (pip install []):
----------------
  * psutil
  * mercurial
  * bzr
  * powerline-status

Powerline fonts
--------------
    $ git clone git@github.com:powerline/fonts.git 

(run install.sh to copy all fonts, choose font in console, e.g. Liberation Mono for powerline)

Clone Tmux Plugin Manager
------------------------
    $ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Hit Prefix+I in tmux to install tmux-resurrect

Clone FASD
-----------
    $ git clone git@github.com:clvv/fasd.git
    $ cd fasd
    $ make install

VIM Plugins: Vundle
-------------------
Launch vim and run :PluginInstall
YouCompleteMe: see https://github.com/Valloric/YouCompleteMe

