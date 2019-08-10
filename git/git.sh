#!/bin/bash

echo_header "GIT Configuration"

echo_item "Symlinking global gitignore" "green"
ln -sf $HOME/dotfiles/git/gitignore_global $HOME/.gitignore_global

echo_item "Symlinking global gitconfig" "green"
ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

echo_item "Symlinking viaplay gitconfig" "green"
ln -sf $HOME/dotfiles/git/gitconfig_viaplay $HOME/code/viaplay/.gitconfig

echo_item "Symlinking personal gitconfig" "green"
ln -sf $HOME/dotfiles/git/gitconfig_conner $HOME/code/conner/.gitconfig

echo_item "Setting  ~/.gitignore_global to global ignore" "green"
git config --global core.excludesfile ~/.gitignore_global

echo ""
