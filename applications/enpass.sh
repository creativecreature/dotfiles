#!/bin/bash

install_enpass() {
  if [[ $(dpkg -l | grep 'enpass' >/dev/null) ]]; then
    echo_item "enpass is already installed" "green"
  else
    echo_item "installing Enpass" "green"
    sudo sh -c 'echo "deb http://repo.sinew.in/ stable main" > /etc/apt/sources.list.d/enpass.list'
    wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
    sudo apt-get -qq --yes update
    sudo apt-get -qq --yes install enpass
  fi
}
