#!/bin/bash

install_xclip() {
  if exists "xclip"; then
    echo_item "xclip is already installed" "green"
  else
    echo_item "installing xclip" "green"
    sudo apt-get -qq --yes install xclip
  fi
}
