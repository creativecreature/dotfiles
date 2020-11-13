#!/bin/bash

uninstall_unwanted_software() {
  if exists "thunderbird"; then
    echo_item "uninstalling thunderbird" "green"
    sudo apt-get -qq --yes remove thunderbird
  else
    echo_item "thunderbird is already uninstalled" "green"
  fi

  if exists "rhythmbox"; then
    echo_item "uninstalling rhythmbox" "green"
    sudo apt-get -qq --yes remove rhythmbox
  else
    echo_item "rhythmbox is already uninstalled" "green"
  fi

  if exists "gnome-mahjongg"; then
    echo_item "uninstalling mahjongg" "green"
    sudo apt-get -qq --yes remove gnome-mahjongg
  else
    echo_item "mahjongg is already uninstalled" "green"
  fi

  if exists "gnome-mines"; then
    echo_item "uninstalling mines" "green"
    sudo apt-get -qq --yes remove gnome-mines
  else
    echo_item "mines is already uninstalled" "green"
  fi
}
