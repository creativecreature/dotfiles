#!/bin/bash

echo_header "NVIM Configuration"

echo_item "Symlinking nvim configuration" "green"
rm -rf /home/$USER_NAME/.config/nvim
ln -sfn /home/$USER_NAME/dotfiles/nvim /home/$USER_NAME/.config/nvim

echo_item "Installing NVIM plugins" "green"
nvim "+PlugInstall" +qall

echo_item "Updating NVIM plugins" "green"
nvim "+PlugUpdate" +qall

echo_item "Installing coc sources" "green"
nvim "+CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-emoji" +qall

echo ""
