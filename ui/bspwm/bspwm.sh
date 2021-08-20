#!/bin/bash

install_bspwm() {
  if exists "bspwm"; then
    echo_item "bspwm is already installed" "green"
  else
    echo_item 'installing bspwm sxhkd' "green"
    sudo apt-get -qq --yes install bspwm
  fi
}

configure_bspwm() {
  mkdir -p ~/.config/bspwm
  mkdir -p ~/.config/sxhkd

  echo_item "symlinking bspwm configuration" "green"
  ln -sf ~/dotfiles/ui/bspwm/bspwmrc ~/.config/bspwm/bspwmrc

  echo_item "symlinking sxhkd configuration" "green"
  ln -sf ~/dotfiles/ui/bspwm/sxhkd ~/.config/sxhkd/sxhkdrc
}
