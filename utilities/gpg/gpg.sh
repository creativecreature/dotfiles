#!/bin/bash

install_gpg() {
  if exists "gpg"; then
    echo_item "gpg is already installed" "green"
  else
    echo_item "installing gpg" "green"
		brew install gnupg
  fi
}

configure_gpg() {
  echo_item "symlinking gpg agent config" "green"
  ln -sf ~/dotfiles/utilities/gpg/gpg-agent.conf ~/.gnupg
}
