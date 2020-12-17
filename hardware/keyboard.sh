#!/bin/bash

configure_keyboard() {
  echo_item "adding US and SE keyboard input sources" "green"
  gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'se')]"
  echo_item "adding the user to the dialout group" "green"
  sudo usermod -a -G dialout $USER # Required for Bazecor
}
