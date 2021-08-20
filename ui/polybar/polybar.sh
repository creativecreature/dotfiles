#!/bin/bash

install_polybar() {
  if exists "polybar"; then
    echo_item "polybar is already installed" "green"
  else
    echo_item 'installing polybar' "green"
    sudo apt install polybar
  fi
}

configure_polybar() {
  mkdir -p ~/.config/polybar

  echo_item "symlinking polybar configuration" "green"
  ln -sf ~/dotfiles/ui/polybar/colors.ini ~/.config/polybar/colors.ini
  ln -sf ~/dotfiles/ui/polybar/config.ini ~/.config/polybar/config.ini
  ln -sf ~/dotfiles/ui/polybar/fonts.ini ~/.config/polybar/fonts.ini
  ln -sf ~/dotfiles/ui/polybar/launch.sh ~/.config/polybar/launch.sh
  ln -sf ~/dotfiles/ui/polybar/modules.ini ~/.config/polybar/modules.ini
}
