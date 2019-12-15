#!/bin/bash

echo_header "GIT Configuration"

echo_item "Symlinking global gitignore" "green"
ln -sf /home/$USER_NAME/dotfiles/git/gitignore_global /home/$USER_NAME/.gitignore_global

echo_item "Symlinking global gitconfig" "green"
ln -sf /home/$USER_NAME/dotfiles/git/gitconfig /home/$USER_NAME/.gitconfig

echo_item "Symlinking viaplay gitconfig" "green"
ln -sf /home/$USER_NAME/dotfiles/git/gitconfig_viaplay /home/$USER_NAME/code/viaplay/.gitconfig

echo_item "Symlinking personal gitconfig" "green"
ln -sf /home/$USER_NAME/dotfiles/git/gitconfig_conner /home/$USER_NAME/code/conner/.gitconfig

echo_item "Setting  ~/.gitignore_global to global ignore" "green"
git config --global core.excludesfile ~/.gitignore_global

echo ""
