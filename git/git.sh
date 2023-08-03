#!/bin/bash

configure_git() {
  echo_item "symlinking global gitignore" "green"
  ln -sf ~/dotfiles/git/gitignore_global ~/.gitignore_global

  echo_item "symlinking global gitconfig" "green"
  ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig

  echo_item "symlinking gitconfig for personal projects" "green"
  ln -sf ~/dotfiles/git/gitconfig_personal ~/code/personal/.gitconfig

  echo_item "symlinking gitconfig for work projects" "green"
  ln -sf ~/dotfiles/git/gitconfig_work ~/code/work/.gitconfig
}
