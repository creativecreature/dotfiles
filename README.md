# Dotfiles

## Introduction
I use these scripts to bootstrap new machines, install software and prevent
configuration drifts between different laptops I use.


## Bootstrapping a new machine
Just download this repository as a zip file. Extract it and run the `bootstrap.sh`
script. The *bootstrap* scripts should only be executed once. See the following
section for instructions on how to sync the latest changes.

The bootstrap scripts will:
- Setup the directory structure.
- Generate SSH keys and change the git remote for this project to use ssh.
- Install and configure software.
- Symlink configuration files.


## Syncing settings
You only need to run the `bootstrap.sh` script once. For subsequent syncs just
execute the `install.sh` script. It will check if there is any new software
to install, as well as symlink configuration files.
