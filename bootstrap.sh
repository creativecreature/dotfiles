#!/bin/bash

source 'scripts/setup_structure.sh'

# -- Solus- or Ubuntu-Specific Setup --------------------------------------------
if system_is_solus; then
  sudo eopkg install git
else
  sudo apt-get -qq update
  sudo apt-get -qq install -y git
fi


# -- Clone and symlink dotfiles repo --------------------------------------------
cd /home/$USER/code/$USER
git clone git@github.com:CharlesConner/dotfiles.git
ln -s /home/$USER/code/$USER/dotfiles /home/$USER/dotfiles
cd dotfiles && ./install.sh
