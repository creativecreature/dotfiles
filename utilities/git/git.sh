#!/bin/bash

install_git() {
  if !exists "git"; then
    echo_item "installing git" "green"
    sudo apt-get -qq --yes install git
  fi
}

configure_git() {
  echo_item "symlinking global gitignore" "green"
  ln -sf ~/dotfiles/utilities/git/gitignore_global ~/.gitignore_global

  echo_item "symlinking global gitconfig" "green"
  ln -sf ~/dotfiles/utilities/git/gitconfig ~/.gitconfig

  echo_item "symlinking creativecreature gitconfig" "green"
  ln -sf ~/dotfiles/utilities/git/gitconfig_creativecreature ~/code/creativecreature/.gitconfig

  echo_item "symlinking personal gitconfig" "green"
  ln -sf ~/dotfiles/utilities/git/gitconfig_conner ~/code/$USER/.gitconfig

  echo_item "setting  ~/.gitignore_global to global ignore" "green"
  git config --global core.excludesfile ~/.gitignore_global
}
