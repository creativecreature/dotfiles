# Dotfiles

## Introduction
I use these scripts to bootstrap new machines, as well as syncing configuration
between different workstations.

## Bootstrapping a new machine
Just download this repository as a zip file. Extract it and run the `bootstrap.sh`
script. It will setup the entire directory structure as well as putting this
repository in the right place and configuring the git remote.

## Syncing settings
You only need to run the `bootstrap.sh` script once. For subsequent syncs just
execute the `install.sh` script. It will check if you miss any of the software,
as well as symlink configuration files.
