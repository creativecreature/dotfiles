#!/bin/bash

install_vlc() {
  if exists "vlc"; then
    echo_item "vlc is already installed" "green"
  else
    echo_item "installing vlc" "green"
    brew install --cask vlc
  fi
}
