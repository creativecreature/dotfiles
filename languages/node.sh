#!/bin/bash

install_node() {
  if exists "node"; then
    echo_item "node is already installed" "green"
  else
    echo_item "installing node" "green"
    curl --silent https://get.volta.sh | bash
    /home/$USER/.volta/bin/volta install node
    /home/$USER/.volta/bin/volta install yarn
    /home/$USER/.volta/bin/volta install neovim
  fi
}
