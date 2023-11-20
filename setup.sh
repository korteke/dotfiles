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

# Install Vim-Plug
PLUGDIR="${HOME}/.vim/autoload/plug.vim"
if [ ! -d $PLUGDIR ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install packages
if [[ "$OSTYPE" =~ ^darwin ]]; then
    brew install fzf ripgrep tmux
fi

if [[ "$OSTYPE" =~ ^linux ]]; then
    sudo apt install fzf ripgrep
fi

echo "${ZSH_CUSTOM}/themes/spaceship-prompt"

#if [ ! -d "${ZSH_CUSTOM}/themes/spaceship-prompt" ]; then
#  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
#  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
#fi

# tmux plugin manager
TPMDIR="${HOME}/.tmux/plugins/tpm"
if [ ! -d $TPMDIR ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

linkDotfile vimrc
linkDotfile tmux.conf
linkDotfile gitconfig
linkDotfile zshrc
