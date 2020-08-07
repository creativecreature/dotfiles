#!/bin/bash

VPN_INSTALLATION=~/.config/dotfile-installs/vpn

echo_header "VPN configuration"

if [[ -f "$VPN_INSTALLATION" ]]; then
  echo_item "VPN packages are already installed" "green"
else
  sudo apt-get -qq install network-manager-openvpn-gnome network-manager-openvpn openvpn
  touch "$VPN_INSTALLATION"
fi

echo ""
