#!/bin/bash

install_gitcrypt() {
  if exists "git-crypt"; then
    echo_item "git crypt is already installed" "green"
  else
    echo_item "installing git crypt" "green"
    sudo apt-get -qq --yes install git-crypt
  fi
}
