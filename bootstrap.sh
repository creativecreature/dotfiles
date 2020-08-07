#!/bin/bash

source 'scripts/helpers.sh'
source 'scripts/setup_structure.sh'

# -- Solus- or Ubuntu-Specific Setup --------------------------------------------
if system_is_OSX; then
  if test ! $(which brew)
  then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
  fi
  brew upgrade
  brew update
  brew tap caskroom/cask
  brew install git
else
  sudo apt-get -qq update
  sudo apt-get -qq install git
fi


# -- Clone and symlink dotfiles repo --------------------------------------------
cd ~/code/$USER
git clone https://github.com/CharlesConner/dotfiles.git
ln -s ~/code/$USER/dotfiles ~/dotfiles
cd ~/dotfiles && ./install.sh
