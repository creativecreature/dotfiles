#!/bin/bash

echo_header "Eslint Configuration"
echo_item "Symlinking global eslint config" "green"
ln -sf /home/$USER/dotfiles/eslint/eslintrc /home/$USER/.eslintrc

echo ""
