#!/bin/bash

install_postgresql() {
  if exists "psql"; then
    echo_item "postgresql is already installed" "green"
  else
    echo_item "installing postgresql" "green"
    sudo apt-get -qq --yes install postgresql
  fi

	if exists "migrate"; then
		echo_item "golang-migrate is already installed" "green"
	else
		echo_item "installing golang-migrate" "green"
		curl -L https://github.com/golang-migrate/migrate/releases/download/v4.14.1/migrate.linux-amd64.tar.gz | tar xvz
		mv migrate.linux-amd64 $GOPATH/bin/migrate
	fi
}
