# Dotfiles

## Introduction
I use these scripts to bootstrap new machines, install software and prevent
configuration drifts between my personal laptop and the one I use at work.

## Bootstrapping a new machine
Clone this as a bare git repository:

```sh
git clone --bare git@github.com:creativecreature/dotfiles.git $HOME/.cfg
```

Checkout the bare repository content to the home directory:

```sh
./checkout.sh
```

Run the bootstrap script to install software, create ssh keys, download oh-my-zsh, etc.

```sh
./bootstrap.sh
```
