#!/bin/bash

install_heroku() {
  if exists "heroku"; then
    echo_item "heroku is already installed" "green"
  else
    echo_item "installing heroku" "green"
    sudo snap install --classic heroku > /dev/null
  fi
}
