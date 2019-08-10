#!/bin/bash

source 'scripts/helpers.sh'

echo_header "Ripgrep Configuration"
echo_item "Symlinking ripgrep ignore file" "green"
ln -sf $HOME/dotfiles/ripgrep/ignore $HOME/.ignore

echo ""
