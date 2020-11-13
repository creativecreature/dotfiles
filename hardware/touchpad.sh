#!/bin/bash

configure_touchpad() {
  echo_item "turning off natural-scroll for the touchpad" "green"
  gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
}
