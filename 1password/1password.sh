#!/bin/bash

if exists "1password"; then
  echo_item "1password is already installed" "green"
else
  sudo apt-key --keyring /usr/share/keyrings/1password.gpg adv --keyserver keyserver.ubuntu.com --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password.gpg] https://downloads.1password.com/linux/debian edge main' | sudo tee /etc/apt/sources.list.d/1password.list
  sudo apt-get -qq --yes update && sudo apt-get -qq --yes install 1password
fi

echo ""
