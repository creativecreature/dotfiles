#!/bin/bash

install_enpass() {
  if [[ $(dpkg -l | grep 'enpass') ]]; then
    echo_item "enpass is already installed" "green"
  else
    echo_item "installing Enpass" "green"
    sudo sh -c 'echo "deb http://repo.sinew.in/ stable main" > /etc/apt/sources.list.d/enpass.list'
    wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
    sudo apt-get -qq --yes update
    sudo apt-get -qq --yes install enpass
  fi
}

configure_enpass() {
  echo_item "setting up enpass shortcut" "green"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Enpass'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/opt/enpass/Enpass showassistant'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Alt><Super>slash'
}
