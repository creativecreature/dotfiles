#!/bin/bash

set -o nounset
set -o errexit

source 'helpers.sh'

# Install XCode Command Line Tools
xcode-select --install &>/dev/null

# Wait until XCode Command Line Tools installation has finished
until $(xcode-select --print-path &>/dev/null); do
	sleep 5
done

# Install software
./install.sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install tmux plugins
create_directory ~/.tmux/plugins
TPM_DIR=~/.tmux/plugins/tpm
if [[ ! -d "$TPM_DIR" ]]; then
	echo_item "cloning tpm directory" "green"
	git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm >/dev/null
fi

# Generate SSH keys
PERSONAL_PUB_KEY=~/.ssh/personal.pub
WORK_PUB_KEY=~/.ssh/work.pub
local keys=("$PERSONAL_PUB_KEY" "$WORK_PUB_KEY")
local key_labels=("personal" "work")
for index in "${!keys[@]}"; do
	if [[ -f "${keys[$index]}" || -L "${keys[$index]}" ]]; then
		echo_item "${key_labels[$index]} ssh key was already created" "green"
	else
		echo_item "generating a ssh key for ${key_labels[$index]} use" "green"
		ssh-keygen -t rsa -b 4096 -f ~/.ssh/${key_labels[$index]} -C "${key_labels[$index]} key"
	fi
done

# Download sketchybar fonts
curl \
	-L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf \
	-o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Run the configuration script
./configure.sh

# Installation complete, ask for reboot
echo "Installation completed successfully."
echo "Some of the changes might require a reboot, want to do that now? [Y/n]"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	sudo shutdown -r
fi
