#!/bin/bash

set -o nounset
set -o errexit

source 'helpers.sh'

# Create folder structure
mkdir -p ~/code/personal ~/code/work ~/bin ~/.config ~/tmp ~/.ssh ~/.gnupg

# Install XCode Command Line Tools.
xcode-select --install &> /dev/null

# Wait until XCode Command Line Tools installation has finished.
until $(xcode-select --print-path &> /dev/null); do
  sleep 5;
done

# Clone dotfiles repo and symlink it to my home directory
git clone https://github.com/creativecreature/dotfiles.git ~/code/personal/dotfiles
ln -s ~/code/personal/dotfiles ~/dotfiles
cd ~/dotfiles

# Run install scripts
./install_osx.sh
# Run configuration scripts
./configure_osx.sh

# Post installation I want to update to ensure that I use ssh auth for this repository
cd ~/dotfiles
git remote set-url origin git@github.com:creativecreature/dotfiles.git

# Installation complete, ask for reboot
echo "Installation completed successfully."
echo "Some of the changes might require a reboot, want to do that now? [Y/n]"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  sudo shutdown -r
fi
