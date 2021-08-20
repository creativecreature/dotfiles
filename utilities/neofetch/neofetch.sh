#!/bin/bash

install_neofetch() {
  if exists "neofetch"; then
    echo_item "neofetch is already installed" "green"
  else
    echo_item 'installing neofetch' "green"
    sudo apt-get -qq --yes install neofetch
  fi
}

configure_neofetch() {
  mkdir -p ~/.config/neofetch

  echo_item "symlinking neofetch configuration" "green"
  ln -sf ~/dotfiles/ui/neofetch/config.conf ~/.config/neofetch/config.conf
}
