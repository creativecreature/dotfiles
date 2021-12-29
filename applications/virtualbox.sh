#!/bin/bash

install_virtualbox() {
  if exists "virtualbox"; then
    echo_item "virtualbox is already installed" "green"
  else
    echo_item "installing virtualbox" "green"
    sudo apt-get -qq --yes install virtualbox
  fi
}
