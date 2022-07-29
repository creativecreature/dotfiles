#!/bin/bash

install_hey() {
  if exists "hey"; then
    echo_item "hey is already installed" "green"
  else
    echo_item "installing hey" "green"
    sudo apt-get -qq --yes install hey
  fi
}
