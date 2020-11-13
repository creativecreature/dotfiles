#!/bin/bash

install_python() {
  if exists "virtualenv"; then
    echo_item "virtualenv already installed" "green"
  else
    echo_item "installing virtualenv" "green"
    sudo apt-get -qq --yes install virtualenv
  fi

  if exists "pipenv"; then
    echo_item "pipenv already installed" "green"
  else
    echo_item "installing pipenv" "green"
    sudo apt-get -qq --yes install python3-pip
    pip3 install pipenv
  fi
}

