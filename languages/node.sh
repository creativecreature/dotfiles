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
    /home/$USER/.volta/bin/volta install typescript
    /home/$USER/.volta/bin/volta install typescript-language-server
    /home/$USER/.volta/bin/volta install pyright
    /home/$USER/.volta/bin/volta install vim-language-server
    /home/$USER/.volta/bin/volta install dockerfile-language-server-nodejs
    /home/$USER/.volta/bin/volta install bash-language-server
    /home/$USER/.volta/bin/volta install diagnostic-languageserver
    /home/$USER/.volta/bin/volta install eslint_d
    /home/$USER/.volta/bin/volta install aws-cdk
  fi
}
