#!/bin/bash

source 'helpers.sh'

# Install software
./install.sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install tmux plugins
create_directory ~/.tmux/plugins
TPM_DIR=~/.tmux/plugins/tpm
if [[ ! -d "$TPM_DIR" ]]; then
	echo_item "cloning tpm directory" "green"
	git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm >/dev/null
fi


# Download sketchybar fonts
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Run the configuration script
./configure.sh

# Installation complete, ask for reboot
echo "Installation completed successfully."
echo "Some of the changes might require a reboot, want to do that now? [Y/n]"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	sudo shutdown -r
fi
