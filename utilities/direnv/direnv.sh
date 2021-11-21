#!/bin/bash

install_direnv() {
  if exists "direnv"; then
    echo_item "direnv is already installed" "green"
  else
    echo_item "installing direnv" "green"
		brew install direnv
  fi
}
