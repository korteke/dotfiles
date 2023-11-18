#!/bin/bash

dotfilesDir=$(pwd)

case "$OSTYPE" in
  darwin*)  echo "OSX" ;;
  linux*)   echo "LINUX" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

function linkDotfile {
  dest="${HOME}/.${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/.${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

# Install Vundle
VUNDLEDIR="${HOME}/.vim/bundle/Vundle.vim"
if [ ! -d $VUNDLEDIR ]; then
  mkdir -p $VUNDLEDIR
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install packages
if [[ "$OSTYPE" =~ ^darwin ]]; then
    brew install fzf ripgrep
fi

if [[ "$OSTYPE" =~ ^linux ]]; then
    sudo apt install fzf ripgrep
fi

linkDotfile vimrc
linkDotfile tmux.conf
#linkDotfile gitconfig
linkDotfile zshrc
