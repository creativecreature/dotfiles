#!/bin/bash

set -o nounset

source 'helpers.sh'
source 'setup_structure.sh'

# Install XCode Command Line Tools.
xcode-select --install &> /dev/null

# Wait until XCode Command Line Tools installation has finished.
until $(xcode-select --print-path &> /dev/null); do
  sleep 5;
done

# Clone dotfiles repo and symlink it to the users home directory
git clone https://github.com/creativecreature/dotfiles.git ~/code/creativecreature/dotfiles
ln -s ~/code/creativecreature/dotfiles ~/dotfiles
cd ~/dotfiles && ./install_osx.sh
./configure_osx.sh

# Post installation I want to update the remote to be ssh instead of https
cd ~/dotfiles && git remote set-url origin git@github.com:creativecreature/dotfiles.git
