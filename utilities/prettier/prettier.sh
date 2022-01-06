#!/bin/bash

install_prettier() {
  if exists "prettier"; then
    echo_item "prettier is already installed" "green"
  else
    echo_item "installing prettier" "green"
    /home/$USER/.volta/bin/volta install prettier
  fi
}

configure_prettier() {
  echo_item "symlinking prettier ignore file" "green"
  ln -sf ~/dotfiles/utilities/prettier/.prettierrc ~/code/.prettierrc
}
