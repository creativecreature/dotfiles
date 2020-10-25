#!/bin/bash

if exists "nvim"; then
  echo_item "Neovim is already installed" "green"
else
  if system_is_OSX; then
    brew install --HEAD neovim
  else
    echo_item "Installing Neovim" "green"
    sudo apt-get -qq install neovim
  fi
fi
echo ""


echo_item "Symlinking nvim configuration" "green"
rm -rf ~/.config/nvim
ln -sfn ~/dotfiles/nvim ~/.config/nvim

echo_item "Installing NVIM plugins" "green"
nvim "+PlugInstall" +qall

echo_item "Updating NVIM plugins" "green"
nvim "+PlugUpdate" +qall

echo_item "Installing coc sources" "green"
nvim "+CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-emoji coc-python coc-actions" +qall

echo ""
