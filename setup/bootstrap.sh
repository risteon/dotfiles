#!/usr/bin/env bash

# The MIT License
# 
# Original Work Copyright (c) Zach Holman, http://zachholman.com
# Modified Work Copyright (c) Christoph Rist
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

set -u

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)


echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}


link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  if [ "$1" == "BACKUP" ]; then
    backup_all=true
  fi

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

install_config_files () {
  info 'installing configuration files'

  local overwrite_all=false backup_all=false skip_all=false

  if [ "$1" == "BACKUP" ]; then
    backup_all=true
  fi

  for src in $(find -H "$DOTFILES_ROOT/config" -maxdepth 1 ! -path "${DOTFILES_ROOT}/config")
  do
    dst="$HOME/.config/$(basename "${src}")"
    link_file "$src" "$dst"
  done
}

create_vim_dirs () {
  mkdir -p $HOME/.vimbackup
  mkdir -p $HOME/.vimtmp
  vim +PlugInstall +qall
}

fetch_gitmodules() {
  git submodule update --init --recursive
}

install_powerline() {
  if [[ ! $(command -v python3) ]]; then
    echo 'python3 not found. Stopping.'
    exit 1
  fi
  
  if [[ ! $(command -v pip3) ]]; then
    echo 'pip3 not found. Stopping.'
    exit 1
  fi
  
  # in user space
  python3 -m pip install https://github.com/powerline/powerline/archive/refs/tags/2.8.2.tar.gz
  python3 -m pip install https://github.com/jaspernbrouwer/powerline-gitstatus/archive/refs/tags/v1.3.1.tar.gz
  
  # find powerline location
  powerline_location=$(python3 -c "import pathlib, powerline; print(pathlib.Path(powerline.__file__).parent.absolute())")

  # add this to local rc files
  printf "# set powerline location\nexport POWERLINE_LOCATION=$powerline_location\n" >> "${HOME}/.localrc.zsh"
  printf "# set powerline location\nexport POWERLINE_LOCATION=$powerline_location\n" >> "${HOME}/.localrc.bash"
}

install_nerd_fonts() {

  font_dir="${HOME}/.local/share/fonts"
  mkdir -p "$font_dir"
  # download SourceCodePro and Meslo Nerd fonts
  (cd "$font_dir" && wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip" && unzip SourceCodePro.zip && rm SourceCodePro.zip)
  (cd "$font_dir" && wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip" && unzip Meslo.zip && rm Meslo.zip)
  (cd "$font_dir" && fc-cache -fv)

  if [[ -n $(command -v fc-cache) ]]; then
    fc-cache -vf "$font_dir"
    
    case $? in
      [0-1])
        # Catch fc-cache returning 1 on a success
        ;;
      *)
        exit $?
        ;;
    esac
  fi

  echo ''
  echo '  Nerd fonts installed!'
}

opt_arg=${1-"none"}

fetch_gitmodules
install_dotfiles $opt_arg
install_config_files $opt_arg
echo ''
echo '  All symlinks installed!'

install_powerline
echo ''
echo '  Powerline installed!'

create_vim_dirs

fzf.symlink/install --key-bindings --completion --no-update-rc
echo ''
echo '  FZF installed!'

install_nerd_fonts

echo ''
echo '  Done!'

