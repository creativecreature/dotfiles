#!/bin/bash

install_dunst() {
  if exists "dunst"; then
    echo_item "dunst is already installed" "green"
  else
    echo_item 'installing dunst' "green"
    sudo apt install dunst
  fi
}
