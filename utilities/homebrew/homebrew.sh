#!/bin/bash

install_homebrew() {
  if exists "homebrew"; then
    echo_item "homebrew is already installed" "green"
  else
    echo_item "installing homebrew" "green"
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  fi
}
