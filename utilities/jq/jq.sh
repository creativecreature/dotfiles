#!/bin/bash

install_jq() {
  if exists "jq"; then
    echo_item "jq is already installed" "green"
  else
    echo_item "installing jq" "green"
    sudo apt-get -qq --yes install jq
  fi
}
