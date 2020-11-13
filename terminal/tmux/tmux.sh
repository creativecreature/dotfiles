#!/bin/bash

install_tmux() {
  if exists "tmux"; then
    echo_item "tmux is already installed" "green"
  else
    echo_item 'installing tmux' "green"
    sudo apt-get -qq --yes install tmux
  fi
}

configure_tmux() {
  echo_item "symlinking tmux configuration" "green"
  mkdir -p ~/.tmux
  ln -sf ~/dotfiles/terminal/tmux/conf ~/.tmux.conf
  ln -sf ~/dotfiles/terminal/tmux/conf.osx ~/.tmux.conf.osx
  ln -sf ~/dotfiles/terminal/tmux/conf.linux ~/.tmux.conf.linux

  mkdir -p ~/.tmux/plugins
  TPM_DIR=~/.tmux/plugins/tpm
  if [[ ! -d "$TPM_DIR" ]]; then
    echo_item "cloning tpm directory" "green"
    git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null
  fi

  echo_item "symlinking tat script" "green"
  ln -sf ~/dotfiles/terminal/tmux/tat ~/bin/tat
}
