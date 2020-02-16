#!/bin/bash

if exists "nvim"; then
  echo_item "Neovim is already installed" "green"
else
  echo_item "Installing Neovim" "green"
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv ./nvim.appimage /usr/bin/nvim
fi

echo ""


echo_item "Symlinking nvim configuration" "green"
rm -rf /home/$USER/.config/nvim
ln -sfn /home/$USER/dotfiles/nvim /home/$USER/.config/nvim

echo_item "Installing NVIM plugins" "green"
nvim "+PlugInstall" +qall

echo_item "Updating NVIM plugins" "green"
nvim "+PlugUpdate" +qall

echo_item "Installing coc sources" "green"
nvim "+CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-emoji coc-python" +qall

echo ""
