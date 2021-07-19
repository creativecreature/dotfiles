#!/bin/bash

install_fonts() {
  if [[ -n $(find ~/.local/share/fonts -type f -name '*Powerline*' 2> /dev/null) ]]; then
    echo_item "powerline fonts are already installed" "green"
  else
    echo_item "installing powerline fonts" "green"
    git clone --quiet https://github.com/powerline/fonts.git --depth=1 > /dev/null
    cd fonts
    ./install.sh > /dev/null
    cd -
    rm -rf fonts
    mkdir ~/.config/fontconfig
    ln -sf ~/dotfiles/ui/fonts.conf ~/.config/fontconfig/fonts.conf
  fi
}
