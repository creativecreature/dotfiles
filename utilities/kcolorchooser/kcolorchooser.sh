#!/bin/bash

install_kcolorchooser() {
  if exists "kcolorchooser"; then
    echo_item "kcolorchooser is already installed" "green"
  else
    echo_item "installing kcolorchooser" "green"
    sudo apt-get -qq --yes install kcolorchooser
  fi
}
