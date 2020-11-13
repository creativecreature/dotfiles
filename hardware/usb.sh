#!/bin/bash

configure_usb() {
  USBWAKEUP=~/dotfiles/hardware/usb_wakeup.sh
  echo_item "enabling usb wakeup" "green"
  sudo ln -s $USBWAKEUP /etc/init.d/usbwakeup &> /dev/null
  sudo ln -s $USBWAKEUP /etc/rc3.d/S01usbwakeup &> /dev/null
}
