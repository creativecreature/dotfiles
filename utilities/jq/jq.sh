#!/bin/bash

install_jq() {
  if exists "jq"; then
    echo_item "jq is already installed" "green"
  else
    echo_item "installing jq" "green"
    brew install jq
  fi
}
