#!/bin/bash

install_icons() {
  ICONS_DIR=/usr/share/icons
  ICON_DIR=/usr/share/icons/Zafiro
  mkdir -p $ICONS_DIR
  if [[ ! -d "$ICON_DIR" ]]; then
    echo_item "installing icons" "green"
    sudo git clone --quiet https://github.com/devaddict/icons.git /usr/share/icons/Zafiro > /dev/null
  else
    echo_item "icons already installed" "green"
  fi
}

configure_icons() {
  echo_item "configuring icons" "green"
  gsettings set org.gnome.desktop.interface icon-theme 'Zafiro'
}
