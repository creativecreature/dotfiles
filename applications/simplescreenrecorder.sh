#!/bin/bash

install_simplescreenrecorder() {
  if exists "simplescreenrecorder"; then
    echo_item "simple screen recorder is already installed" "green"
  else
    echo_item "installing simple screen recorder" "green"
    sudo apt-get -qq --yes install simplescreenrecorder
  fi
}
