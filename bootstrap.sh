#!/bin/bash

export USER_NAME=${NAME:=conner}

source 'scripts/setup_structure.sh'


# -- Solus- or Ubuntu-Specific Setup --------------------------------------------
if system_is_solus; then
  sudo eopkg install git
else
  sudo apt-get -qq update
  sudo apt-get -qq install -y git
fi


# -- Clone and symlink dotfiles repo --------------------------------------------
cd /home/$USER_NAME/code/$USER_NAME
git clone git@github.com:CharlesConner/dotfiles.git
ln -s /home/$USER_NAME/code/$USER_NAME/dotfiles /home/$USER_NAME/dotfiles
cd dotfiles && ./install.sh
