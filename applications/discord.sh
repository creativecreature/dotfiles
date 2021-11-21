#!/bin/bash

install_discord() {
  if exists "discord"; then
    echo_item "discord is already installed" "green"
  else
    echo_item "installing discord" "green"
    brew install --cask discord
  fi
}
