#!/bin/bash

source 'scripts/helpers.sh'

echo_header "NVIM Configuration"
echo_item "Linked nvim configuration" "green"
rm -rf $HOME/.config/nvim
ln -sfn $HOME/dotfiles/nvim $HOME/.config/nvim

echo ""
