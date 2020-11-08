#!/bin/bash

echo_header "Rust configuration"
if exists "rustup"; then
  echo_item "Rust is already installed" "green"
else
  echo_item "Installing rustup" "green"
  if exists "rustc"; then
    sudo apt-get remove -qq --yes rustc
  fi
  curl --silent --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

echo ""
