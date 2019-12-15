#!/bin/bash

echo_header "Ripgrep Configuration"
echo_item "Symlinking ripgrep ignore file" "green"
ln -sf /home/$USER_NAME/dotfiles/ripgrep/ignore /home/$USER_NAME/.ignore

echo ""
