#!/bin/bash


if exists "docker"; then
  echo_item "Docker is already installed" "green"
else
  sudo apt-get -qq install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
  sudo apt-get -qq update
  sudo apt-get -qq install docker-ce
  sudo usermod -a -G docker $USER
  sudo systemctl enable docker
fi

if exists "docker-compose"; then
  echo_item "Docker-compose is already installed" "green"
else
  echo_item "Installing Docker-compose" "green"
  sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

echo ""
