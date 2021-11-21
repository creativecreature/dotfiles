#!/bin/bash

install_docker() {
  if exists "docker"; then
    echo_item "docker is already installed" "green"
  else
    echo_item "installing docker" "green"
		brew install --cask docker
  fi
}
