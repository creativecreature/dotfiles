#!/bin/bash

install_golang() {
  if exists "go"; then
    echo_item "golang is already installed" "green"
  else
    echo_item "installing golang" "green"
		curl -O https://storage.googleapis.com/golang/go1.18.3.linux-amd64.tar.gz
		sudo tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz
		rm -rf go1.83.linux-amd64.tar.gz
  fi
}
