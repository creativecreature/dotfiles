#!/bin/bash

echo_header "GIT Configuration"

echo_item "Symlinking global gitignore" "green"
ln -sf /home/$USER/dotfiles/git/gitignore_global /home/$USER/.gitignore_global

echo_item "Symlinking global gitconfig" "green"
ln -sf /home/$USER/dotfiles/git/gitconfig /home/$USER/.gitconfig

echo_item "Symlinking viaplay gitconfig" "green"
ln -sf /home/$USER/dotfiles/git/gitconfig_viaplay /home/$USER/code/viaplay/.gitconfig

echo_item "Symlinking personal gitconfig" "green"
ln -sf /home/$USER/dotfiles/git/gitconfig_conner /home/$USER/code/conner/.gitconfig

echo_item "Setting  ~/.gitignore_global to global ignore" "green"
git config --global core.excludesfile /home/$USER/.gitignore_global

echo ""
