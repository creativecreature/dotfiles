#!/bin/bash

install_tree() {
  if exists "tree"; then
    echo_item "tree is already installed" "green"
  else
    echo_item "installing tree" "green"
    sudo apt-get -qq --yes install tree
  fi
}
