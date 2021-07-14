#!/bin/bash

install_alacritty() {
  if exists "alacritty"; then
    echo_item "alacritty is already installed" "green"
  else
    echo_item "installing alacritty" "green"
    git clone --quiet https://github.com/alacritty/alacritty.git --depth=1 ~/alacritty
    cd ~/alacritty
    rustup override set stable
    rustup update stable
    sudo apt-get -qq --yes install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
    cargo build --release
    sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
    sudo cp target/release/alacritty /usr/local/bin
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
    sudo mkdir -p /usr/local/share/man/man1
    gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    cd -
    rm -rf ~/alacritty
  fi
}

configure_alacritty() {
  echo_item "symlinking alacritty config" "green"
  mkdir -p ~/.config/alacritty
  ln -sf ~/dotfiles/terminal/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
}
