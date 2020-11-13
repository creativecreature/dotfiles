#!/bin/bash

install_vlc() {
  if exists "vlc"; then
    echo_item "vlc is already installed" "green"
  else
    echo_item "installing vlc" "green"
    sudo apt-get -qq --yes install vlc
  fi
}
