#!/bin/bash


USBWAKEUP=$HOME/dotfiles/startup/wakeup.sh

echo_header "Startup scripts"

echo_item "Symlinking usbwakeup script" "green"
sudo ln -s $USBWAKEUP /etc/init.d/usbwakeup
sudo ln -s $USBWAKEUP /etc/rc3.d/S01usbwakeup

echo ""
