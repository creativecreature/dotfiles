#!/bin/bash

echo_header "Ripgrep Configuration"
echo_item "Symlinking ripgrep ignore file" "green"
ln -sf /home/$USER/dotfiles/ripgrep/ignore /home/$USER/.ignore

echo ""
