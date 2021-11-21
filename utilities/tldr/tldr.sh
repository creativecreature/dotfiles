#!/bin/bash

install_tldr() {
  if exists "tldr"; then
    echo_item "tldr is already installed" "green"
  else
    echo_item "installing tldr" "green"
    brew install tldr
  fi
}
