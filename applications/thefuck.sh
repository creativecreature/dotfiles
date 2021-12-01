#!/bin/bash

install_thefuck() {
  if exists "thefuck"; then
    echo_item "thefuck is already installed" "green"
  else
    echo_item "installing thefuck" "green"
    brew install --cask thefuck
  fi
}
