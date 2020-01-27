#!/bin/bash

install_plug() {
  mkdir -p "~/.vim/autoload"
  curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  >> ~/.vim/autoload/plug.vim
  cp .vimrc ~/.vimrc
  vim +PluginInstall +qall
  (cd ~/.vim/bundle/YouCompleteMe || cd ~/.vim/plugged/YouCompleteMe) && ./install.py --clang-completer && vim +YcmRestartServer
}

install_mac() {
  brew install vim
  install_plug
}

install_linux() {
  sudo apt-get install -y vim-nox
  install_plug
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     install_linux;;
    Darwin*)    install_mac;;
    *)          
        echo "Error unknown system: ${unameOut}" 1>&2
        exit 64
esac
