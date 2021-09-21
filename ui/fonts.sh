#!/bin/bash

install_fonts() {
  echo_item "installing fonts" "green"
  mkdir -p ~/.config/fontconfig
  ln -sf ~/dotfiles/ui/fonts.conf ~/.config/fontconfig/fonts.conf
}
