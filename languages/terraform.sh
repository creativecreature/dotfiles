#!/bin/bash

install_terraform() {
  if exists "tfenv"; then
    echo_item "tfenv is already installed" "green"
  else
    echo_item "installing tfenv" "green"
    git clone https://github.com/tfutils/tfenv.git ~/.tfenv
    sudo ln -s ~/.tfenv/bin/* /usr/local/bin
  fi
}
