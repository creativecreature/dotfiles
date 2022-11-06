#!/bin/bash
source 'helpers.sh'

set o nounset

echo ""
echo_header "Starting installation"

# Ask for the admin password upfront, and run a keep-alive to update existing `sudo` time stamp untilthe script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo_item "Installing homebrew" "green"
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/conner/.zprofile
   eval "$(/opt/homebrew/bin/brew shellenv)"
fi

WANTED_PACKAGES=(
	coreutils
	direnv
	dockutil
	efm-langserver
	fzf
	git-crypt
	git-lfs
	gnupg
	go
	golang-migrate
	hugo
	jq
	mongodb-community
	neovim
	orlangure/tap/gocovsh
	postgresql
	ripgrep
	rust
	starship
	tfenv
	tig
	tldr
	tmux
	tree
	wget
)
INSTALLED_PACKAGES=$(brew leaves)

WANTED_CASKS=(
	1password
	1password-cli
	amethyst
	centered
	discord
	firefox
	firefox-developer-edition
	goland
	google-chrome
	kitty
	mongodb-compass
	monodraw
	nordvpn
	obsidian
	postman
	slack
	todoist
	vlc
  font-hack-nerd-font
)
INSTALLED_CASKS=$(brew list --cask)

# Filter out already installed packages and casks
for index in "${!WANTED_PACKAGES[@]}"; do
	if [[ "${INSTALLED_PACKAGES[*]}" =~ "${WANTED_PACKAGES[$index]}" ]]; then
		unset -v WANTED_PACKAGES[$index]
	fi
done

for index in "${!WANTED_CASKS[@]}"; do
	if [[ "${INSTALLED_CASKS[*]}" =~ "${WANTED_CASKS[$index]}" ]]; then
		unset -v WANTED_CASKS[$index]
	fi
done

echo_item "Updating homebrew" "green"
brew upgrade
brew update
brew tap mongodb/brew
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

if [ ${#WANTED_PACKAGES[@]} -eq 0 ]; then
	echo_item "All packages are already installed" "green"
else
	echo_item "Installing packages" "green"
	brew install ${WANTED_PACKAGES[@]}
fi

if [ ${#WANTED_CASKS[@]} -eq 0 ]; then
	echo_item "All casks are already installed" "green"
else
	echo_item "Installing casks" "green"
	brew install ${WANTED_CASKS[@]} --cask
fi

echo_item "Performing cleanup" "green"
brew cleanup

install_node() {
  if exists "node"; then
    echo_item "node is already installed" "green"
  else
    echo_item "installing node" "green"
		curl --silent https://get.volta.sh | bash
    volta install node
    volta install yarn
    volta install neovim
    volta install typescript
    volta install diagnostic-languageserver
		volta install prettier
    volta install eslint_d
    volta install aws-cdk
  fi
}
install_node


install_oh_my_zsh() {
	if [[ -d ~/.oh-my-zsh ]]; then
		echo_item "oh my zsh is already installed" "green"
	else
		echo_item "installing oh my zsh" " green"
		curl --silent -L http://install.ohmyz.sh | sh
	fi

	if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
		echo_item "zsh-autosuggestions are already installed" "green"
	else
		echo_item "installing zsh-autosuggestions" "green"
		git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	fi

	if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
		echo_item "zsh-syntax-highlighting is already installed" "green"
	else
		echo_item "installing zsh-syntax-highlighting" "green"
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	fi
}
install_oh_my_zsh

# Install useful fzf keybindings and fuzzy completion
# $(brew --prefix)/opt/fzf/install
