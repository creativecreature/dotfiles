#!/bin/bash

install_kap() {
  if exists "kap"; then
    echo_item "kap is already installed" "green"
  else
    echo_item "installing kap" "green"
    brew install --cask kap
  fi
}
