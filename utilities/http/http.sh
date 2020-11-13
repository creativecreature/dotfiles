#!/bin/bash

install_http_utils() {
  if exists "curl"; then
    echo_item "curl is already installed" "green"
  else
    echo_item "installing curl" "green"
    sudo apt-get -qq --yes install curl
  fi

  if exists "wget"; then
    echo_item "wget is already installed" "green"
  else
    echo_item "installing wget" "green"
    sudo apt-get -qq --yes install wget
  fi
}
