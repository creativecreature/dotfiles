#!/bin/bash

source 'helpers.sh'

echo ""
echo_header "Starting installation"

# Ask for the admin password upfront, and run a keep-alive to
# update the `sudo` timestamp until the script has finished.
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# Check for Homebrew. Install if needed.
if test ! $(which brew); then
	echo_item "Installing homebrew" "green"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/$USER/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo_item "Tapping additional homebrew repositories" "green"
brew tap FelixKratz/formulae

echo_item "Updating homebrew" "green"
brew update
brew upgrade

# These are the packages we want to have installed
WANTED_PACKAGES=(
	awscli
	borders
	btop
	coreutils
	direnv
	dive
	dockutil
	efm-langserver
	flyctl
	fzf
	git-crypt
	git-lfs
	gnupg
	go
	goland
	golang-migrate
	goreleaser
	hey
	hugo
	jq
	lazygit
	lua
	ncdu
	neovim
	nowplaying-cli
	orlangure/tap/gocovsh
	pnpm
	postgresql
	protobuf
	raycast
	redis
	ripgrep
	rust
	sketchybar
	slack
	spotify
	starship
	switchaudio-osx
	tfenv
	tig
	tldr
	tmux
	tree
	volta
	websocat
	wget
	youtube-dl
	sf-symbols
	spotify
	zsh-autosuggestions
	font-hack-nerd-font
	zsh-syntax-highlighting
)

# These are the currently installed packages
INSTALLED_PACKAGES=$(brew leaves)

# Extract the packages that we are missing
for index in "${!WANTED_PACKAGES[@]}"; do
	if [[ "${INSTALLED_PACKAGES[*]}" =~ "${WANTED_PACKAGES[$index]}" ]]; then
		unset -v WANTED_PACKAGES[$index]
	fi
done

# These are the casks we want to have installed
WANTED_CASKS=(
	1password
	1password-cli
	discord
	figma
	firefox
	firefox-developer-edition
	google-chrome
	homebrew/cask-fonts/font-sf-mono
	homebrew/cask-fonts/font-sf-pro
	insomnia
	kap
	mongodb-compass
	monodraw
	nikitabobko/tap/aerospace
	nordvpn
	obsidian
	postman
	redisinsight
)

# These are the currently installed casks
INSTALLED_CASKS=$(brew list --cask)

# Extract the casks that we are missing
for index in "${!WANTED_CASKS[@]}"; do
	if [[ "${INSTALLED_CASKS[*]}" =~ "${WANTED_CASKS[$index]}" ]]; then
		unset -v WANTED_CASKS[$index]
	fi
done

if [ ${#WANTED_PACKAGES[@]} -eq 0 ]; then
	echo_item "All packages are already installed" "green"
else
	echo_item "Installing package: ${WANTED_PACKAGES[@]}" "green"
	brew install ${WANTED_PACKAGES[@]}
fi

if [ ${#WANTED_CASKS[@]} -eq 0 ]; then
	echo_item "All casks are already installed" "green"
else
	echo_item "Installing cask: ${WANTED_CASKS[@]}" "green"
	brew install ${WANTED_CASKS[@]} --cask
fi

echo_item "Performing homebrew cleanup" "green"
brew cleanup
