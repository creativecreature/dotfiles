#!/bin/bash

install_tree() {
  if exists "tree"; then
    echo_item "tree is already installed" "green"
  else
    echo_item "installing tree" "green"
    brew install tree
  fi
}
