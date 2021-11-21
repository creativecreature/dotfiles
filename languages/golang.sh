#!/bin/bash

install_golang() {
  if exists "go"; then
    echo_item "golang is already installed" "green"
  else
    echo_item "installing golang" "green"
		brew install go
  fi
}
