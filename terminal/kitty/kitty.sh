#!/bin/bash

install_kitty() {
  if exists "kitty"; then
    echo_item "kitty is already installed" "green"
  else
    echo_item "installing kitty" "green"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  fi
}

configure_kitty() {
  echo_item "symlinking kitty config" "green"
  mkdir -p ~/.config/kitty
  ln -sf ~/dotfiles/terminal/kitty/kitty.conf ~/.config/kitty/kitty.conf
}
