#!/bin/bash

source './scripts/helpers.sh'

GLOBAL_GIT_IGNORE=$HOME/.gitignore_global
GLOBAL_GIT_CONFIG=$HOME/.gitconfig
PERSONAL_GIT_CONFIG=$HOME/code/conner/.gitconfig
VIAPLAY_GIT_CONFIG=$HOME/code/viaplay/.gitconfig

echo_header "GIT configuration"

if [[ -f "$GLOBAL_GIT_IGNORE" || -L "$GLOBAL_GIT_IGNORE" ]]; then
  echo_item "Global gitignore already exists" "green"
else
  echo_item "Symlinking global gitignore" "green"
  ln -sf $HOME/dotfiles/git/gitignore_global $HOME/.gitignore_global
fi

if [[ -f "$GLOBAL_GIT_CONFIG" || -L "$GLOBAL_GIT_CONFIG" ]]; then
  echo_item "Global gitconfig already exists" "green"
else
  echo_item "Symlinking global gitconfig" "green"
  ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
fi

if [[ -f "$VIAPLAY_GIT_CONFIG" || -L "$VIAPLAY_GIT_CONFIG" ]]; then
  echo_item "Viaplay gitconfig already exists" "green"
else
  echo_item "Symlinking viaplay gitconfig" "green"
  ln -sf $HOME/dotfiles/git/gitconfig_viaplay $HOME/code/viaplay/.gitconfig
fi

if [[ -f "$PERSONAL_GIT_CONFIG" || -L "$PERSONAL_GIT_CONFIG" ]]; then
  echo_item "Personal gitconfig already exists" "green"
else
  echo_item "Symlinking personal gitconfig" "green"
  ln -sf $HOME/dotfiles/git/gitconfig_conner $HOME/code/conner/.gitconfig
fi

echo_item "Setting  ~/.gitignore_global to global ignore" "green"
git config --global core.excludesfile ~/.gitignore_global

echo ""
