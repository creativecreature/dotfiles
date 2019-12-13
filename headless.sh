#!/bin/bash

export USER_NAME=${NAME:=conner}
export HEADLESS=true

source 'scripts/setup_structure.sh'

find . -type f -print0 | xargs -0 sed -i 's/sudo //g'
cp -r . /home/$USER_NAME/dotfiles
