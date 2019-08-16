#!/bin/bash

# -- Import helper scripts -----------------------------------------------------
source 'scripts/helpers.sh'


# -- Setup directory structure -------------------------------------------------
source 'scripts/setup_structure.sh'



# -- Solus- or Ubuntu-Specific Setup --------------------------------------------
if system_is_solus; then
  sudo eopkg install git
else
  sudo apt-get update
  sudo apt-get install -y git
fi


# -- Clone and symlink dotfiles repo --------------------------------------------
cd $HOME/code/conner
git clone https://github.com/CharlesConner/dotfiles.git
ln -s $HOME/code/conner/dotfiles $HOME/dotfiles
./install.sh
