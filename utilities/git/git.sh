#!/bin/bash

configure_git() {
  echo_item "symlinking global gitignore" "green"
  ln -sf ~/dotfiles/utilities/git/gitignore_global ~/.gitignore_global

  echo_item "symlinking global gitconfig" "green"
  ln -sf ~/dotfiles/utilities/git/gitconfig ~/.gitconfig

  echo_item "symlinking creativecreature gitconfig" "green"
  ln -sf ~/dotfiles/utilities/git/gitconfig_creativecreature ~/code/creativecreature/.gitconfig
}
