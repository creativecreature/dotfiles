#!/bin/bash

# wakeup usb
for filename in /sys/bus/usb/devices/*/power/wakeup; do
  echo enabled > $filename
done
