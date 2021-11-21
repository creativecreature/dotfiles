#!/bin/bash

install_fzf() {
  if exists "fzf"; then
    echo_item "fzf is already installed" "green"
  else
    echo_item "installing fzf" "green"
		brew install fzf
		$(brew --prefix)/opt/fzf/install
  fi
}
