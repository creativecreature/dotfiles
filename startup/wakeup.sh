#!/bin/bash

for filename in /sys/bus/usb/devices/*/power/wakeup; do
  echo enabled > $filename
done
