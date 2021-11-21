#!/bin/bash

install_starship() {
  if exists "starship"; then
    echo_item "starship is already installed" "green"
  else
    echo_item "installing starship" "green"
		brew install starship
  fi
}
