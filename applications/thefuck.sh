#!/bin/bash

install_thefuck() {
  if exists "thefuck"; then
    echo_item "thefuck is already installed" "green"
  else
    echo_item "installing thefuck" "green"
		sudo apt update
		sudo apt install python3-dev python3-pip python3-setuptools
		pip3 install thefuck --user
  fi
}
