#!/bin/bash

install_direnv() {
  if exists "direnv"; then
    echo_item "direnv is already installed" "green"
  else
    echo_item "installing direnv" "green"
    sudo apt-get -qq --yes install direnv
  fi
}
