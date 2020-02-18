#!/bin/bash


USBWAKEUP=~/dotfiles/startup/wakeup.sh

echo_header "Startup scripts"

echo_item "Symlinking usbwakeup script" "green"
sudo ln -s $USBWAKEUP /etc/init.d/usbwakeup &> /dev/null
sudo ln -s $USBWAKEUP /etc/rc3.d/S01usbwakeup &> /dev/null

echo ""
