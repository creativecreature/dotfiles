#!/bin/bash

echo_header "Gesture Configuration"

if exists "libinput-gestures"; then
  echo_item "Libinput gesture is already installed" "green"
else
  echo_item "Installing libinput-gesture, xdotool and wmctrl" "green"
  sudo gpasswd -a $USER input # Need to be a member of input group to read touchpad
  sudo apt-get -qq install xdotool wmctrl libinput-tools
  git clone --silent http://github.com/bulletmark/libinput-gestures > /dev/null
  cd libinput-gestures
  sudo ./libinput-gestures-setup install > /dev/null
  cd -
  libinput-gestures-setup start > /dev/null
  libinput-gestures-setup autostart > /dev/null
  rm -rf libinput-gestures
  cp /etc/libinput-gestures.conf ~/.config/libinput-gestures.conf # Copy a local conf file
fi
