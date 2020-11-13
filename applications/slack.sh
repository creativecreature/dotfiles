#!/bin/bash

install_slack() {
  if exists "slack"; then
    echo_item "slack is already installed" "green"
  else
    echo_item "installing slack" "green"
    sudo snap install slack --classic > /dev/null
  fi
}
