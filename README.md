# dotfiles

## Introduction
I use this repository to prevent configuration drift between different machines I work on. It is highly opiniated and will
setup the development environment just the way I like it.

## Pre-install options for linux
To use the spaceship prompt and make the npm installment work run this before executing any of these scripts: `sudo chown -R $USER /usr/local/share
`

## What will be installed
- Git (Installation and configuration)
- Ssh (Configuration and key generation)
- Zsh (Installation and configuration)
- Neovim (Installation and configuration)
- Tmux (Installation and configuration)
- Eslint (Installation and global configuration)
- Ripgrep (Installation and configuration)
- Curl (Installation)
- Wget (Installation)
- Nvm (Installation and configuration)
- Jq (Installation)
- Docker (Installation)
- Virtualenv (Installation)
- Pipenv (Installation)
- Powerline fonts (Installation)
- VLC (Installation)
- Slack (Installation)
- Firefox (Installation)
- Insomnia (Installation)
- Caffeine (Installation)

- Linux Build Tools (Linux only installation)
- Gnome tweaks (Linux only installation)
- Xclip (Linux only installation)
- Exfat (Linux only installation)
- Dock (Linux only configuration)
- Enpass (Linux only installation)
- Blueman (Linux only installation)
- Open vpn (Linux only installation)
- Network manager openvpn(Linux only installation)
- Datagrip (Linux only installation)
- Heroku (Linux only installation)
- Libinput-gestures (Linux only installation)

- Brew (OSX only installation)
- Iterm2 (OSX only installation and configuration)
- Dash (OSX only installation)
- Evernote (OSX only installation)
- Spectacle (OSX only installation)
- 1password (OSX only installation)
- Tig (OSX only installation)


## Installation
To use it simply download this repository to any location on your computer and run `./bootstrap.sh`.
After running the bootstrap please restart your computer for all changes to take effect.


## Updates
You should only run `bootstrap.sh` once. After that you can just do `./install.sh`
after each git pull to get the latest updates.

## Notes on Gnome Terminal
To manipulate the gnome terminal through scripting there has to be an initial profile.
If you never used gnome terminal before simply open the preferences and just do a single edit
for a profile to be created, like hiding the scrollbar.

