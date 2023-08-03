#!/bin/bash

configure_kitty() {
  echo_item "symlinking kitty config" "green"
  mkdir -p ~/.config/kitty
  mkdir -p ~/.config/kitty/themes
	ln -sf ~/dotfiles/kitty/light.conf ~/.config/kitty/themes/light.conf
	ln -sf ~/dotfiles/kitty/dark.conf ~/.config/kitty/themes/dark.conf
  ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
}
