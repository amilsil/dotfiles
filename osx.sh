#!/bin/bash

# Install requirements
brew install cmake
brew install node
brew install python@2

# neovim lang ext
pip install neovim
pip3 install neovim
npm install neovim

# Install Vim Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins through vim itself
nvim --headless +PlugInstall +q
