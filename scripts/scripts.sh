#!/bin/bash

install_scripts() {
  for filepath in ~/dotfiles/scripts/*; do
    [[ -e "$filepath" ]] && ! [[ "$filepath" =~ scripts\.sh ]] || continue
    filename=${filepath##*/}
    ln -sf $filepath ~/bin/$filename
  done
}
