#!/bin/bash

# -- Import helper scripts ---------------------------------------------------
source 'scripts/helpers.sh'


# -- Ask for sudo password and keep alive -------------------------------------
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



# -- OSX- or Ubuntu-Specific Setup --------------------------------------------
if system_is_OSX; then
  source 'osx/osx.sh'
else
  source 'ubuntu/ubuntu.sh'
fi



# -- GIT -------------------------------------------------------------------------
source 'git/git.sh'



# -- SSH -------------------------------------------------------------------------
source 'ssh/ssh.sh'



# -- ZSH Setup --------------------------------------------------------------------
source 'zsh/zsh.sh'



# -- ESLINT ------------------------------------------------------------------------
source 'eslint/eslint.sh'



# -- RIPGREP -----------------------------------------------------------------------
source 'ripgrep/ripgrep.sh'



# -- Bin -------------------------------------------------------------------
for filepath in ~/dotfiles/bin/*; do
  [ -e "$filepath" ] || continue
  filename=${filepath##*/}
  ln -sf $filepath ~/bin/$filename
done
