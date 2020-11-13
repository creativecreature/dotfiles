#!/bin/bash

install_scripts() {
  echo_item "Installing scripts" "green"
  for filepath in ~/dotfiles/scripts/*; do
    [[ -e "$filepath" ]] && ! [[ "$filepath" =~ scripts\.sh ]] || continue
    filename=${filepath##*/}
    ln -sf $filepath ~/bin/$filename
  done
}
