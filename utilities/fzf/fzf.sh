#!/bin/bash

install_fzf() {
  if exists "fzf"; then
    echo_item "fzf is already installed" "green"
  else
    echo_item "installing fzf" "green"
    sudo apt-get -qq --yes install fzf
  fi
}
