#!/bin/bash

set -o nounset

source 'helpers.sh'
source 'setup_structure.sh'
source 'utilities/git/git.sh'

install_git


# Clone dotfiles repo and symlink it to the users home directory
git clone https://github.com/CharlesConner/dotfiles.git ~/code/$USER
ln -s ~/code/$USER/dotfiles ~/dotfiles
cd ~/dotfiles && ./install.sh

# Post installation I want to update the remote to be ssh instead of https
cd ~/dotfiles && git remote set-url origin git@github.com:charlesconner/dotfiles.git
