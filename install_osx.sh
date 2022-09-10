#!/bin/bash
source 'helpers.sh'

set o nounset

echo ""
echo_header "Starting installation"

## TODO Move this

# Ask for the admin password upfront, and run a keep-alive to update existing `sudo` time stamp untilthe script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install the command line tools
if exists "xcode-select"; then
	echo_item "Command line tools are already installed." "green"
 else
	 xcode-select --install
fi

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo_item "Installing homebrew" "green"
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/conner/.zprofile
   eval "$(/opt/homebrew/bin/brew shellenv)"
fi

PACKAGES=(
	coreutils
	mas
	1password
	1password-cli
	dockutil
	neovim
	tmux
	starship
	rg
	fzf
	wget
	direnv
	gnupg
	tig
	git-crypt
	git-lfs
	go
	efm-langserver
	volta
	rust
	tfenv
	jq
	tldr
	tree
	spotify-tui
	spotifyd
	mongodb-community@6.0
	postgresql
	golang-migrate
)

CASKS=(
	kitty
	nordvpn
	centered
	todoist
	google-chrome
	firefox
	firefox-developer-edition
	slack
	discord
	vlc
	amethyst
	mongodb-compass
	postman
)

# Filter out already installed packages and casks
for index in "${!PACKAGES[@]}"; do
	if exists ${PACKAGES[index]}; then
		unset -v PACKAGES[$index]
	fi
done

brew tap homebrew/cask-versions
for index in "${!CASKS[@]}"; do
	if exists ${CASKS[index]}; then
		unset -v CASKS[$index]
	fi
done

echo_item "Updating homebrew" "green"
brew upgrade
brew update

echo_item "Installing packages" "green"
brew install ${PACKAGES[@]}

echo_item "Installing casks" "green"
brew install ${CASKS[@]} --cask

echo_item "Performing cleanup" "green"
brew cleanup

echo_item "Installing nerdfonts" "green"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

install_node() {
  if exists "node"; then
    echo_item "node is already installed" "green"
  else
    echo_item "installing node" "green"
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
