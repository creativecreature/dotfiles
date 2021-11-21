#!/bin/bash

install_ripgrep() {
  if exists "rg"; then
    echo_item "ripgrep is already installed" "green"
  else
    echo_item "installing ripgrep" "green"
		brew install rq
  fi
}

configure_ripgrep() {
  echo_item "symlinking ripgrep ignore file" "green"
  ln -sf ~/dotfiles/utilities/ripgrep/ignore ~/.ignore
}
