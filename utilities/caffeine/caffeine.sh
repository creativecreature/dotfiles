#!/bin/bash

install_caffeine() {
  if exists "caffeine"; then
    echo_item "caffeine is already installed" "green"
  else
    echo_item "installing caffeine" "green"
    sudo apt-get -qq --yes install caffeine
  fi
}
