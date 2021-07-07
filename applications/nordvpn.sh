#!/bin/bash

install_nordvpn() {
  if exists "nordvpn"; then
    echo_item "nordvpn is already installed" "green"
  else
    echo_item "installing nordvpn" "green"
    cd ~/Downloads
    wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
    sudo dpkg -i ./nordvpn-release_1.0.0_all.deb > /dev/null
    sudo apt-get -qq --yes update
    sudo apt-get -qq --yes install nordvpn
    sudo usermod -aG nordvpn $USER
    cd -
  fi
}
