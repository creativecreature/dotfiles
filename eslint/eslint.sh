#!/bin/bash

source 'scripts/helpers.sh'

echo_header "Eslint Configuration"
echo_item "Symlinking global eslint config" "green"
ln -sf $HOME/dotfiles/eslint/eslintrc $HOME/.eslintrc

echo ""
