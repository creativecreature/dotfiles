#!/bin/bash

echo_header "GIT Configuration"

echo_item "Symlinking global gitignore" "green"
ln -sf ~/dotfiles/git/gitignore_global ~/.gitignore_global

echo_item "Symlinking global gitconfig" "green"
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig

echo_item "Symlinking viaplay gitconfig" "green"
ln -sf ~/dotfiles/git/gitconfig_viaplay ~/code/viaplay/.gitconfig

echo_item "Symlinking personal gitconfig" "green"
ln -sf ~/dotfiles/git/gitconfig_conner ~/code/conner/.gitconfig

echo_item "Setting  ~/.gitignore_global to global ignore" "green"
git config --global core.excludesfile ~/.gitignore_global

echo ""
