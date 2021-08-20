#!/bin/bash

install_picom() {
  if exists "picom"; then
    echo_item "picom is already installed" "green"
  else
    echo_item 'installing picom' "green"
    sudo apt-get -qq --yes install picom
  fi
}

configure_picom() {
  mkdir -p ~/.config/picom

  echo_item "symlinking picom configuration" "green"
  ln -sf ~/dotfiles/ui/picom/picom.conf ~/.config/picom/picom.conf
}
