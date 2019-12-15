#!/bin/bash

echo_header "Eslint Configuration"
echo_item "Symlinking global eslint config" "green"
ln -sf /home/$USER_NAME/dotfiles/eslint/eslintrc /home/$USER_NAME/.eslintrc

echo ""
