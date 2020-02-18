#!/bin/bash

echo_header "Terminal configuration"

echo_item "Symlinking GTK styles for the terminal" "green"
ln -sfn ~/dotfiles/terminal/gtk.css ~/.config/gtk-3.0/gtk.css

echo_item "Setting up terminal colors" "green"
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
rm $TERM.ti

# I dont like this solution much but I havent found a way to query the gnome terminal
# for profile names, only ID's.
PROFILE_FILE=~/.config/dotfile-installs/palenightprofile
if [[ -f  "$PROFILE_FILE" ]]; then
  echo_item "Palenight profile for gnome is already installed" "green"
else
  echo_item "Installing palenight profile" "green"
  git clone https://github.com/CharlesConner/palenight-gnome-term --depth=1
  cd palenight-gnome-term
  ./palenight.sh
  cd -
  rm -rf palenight-gnome-term
  touch $PROFILE_FILE
fi

echo ""
