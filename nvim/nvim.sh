#!/bin/bash

echo_header "NVIM Configuration"

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
