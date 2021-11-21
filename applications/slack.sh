#!/bin/bash

install_slack() {
  if exists "slack"; then
    echo_item "slack is already installed" "green"
  else
    echo_item "installing slack" "green"
    brew install --cask slack
  fi
}
