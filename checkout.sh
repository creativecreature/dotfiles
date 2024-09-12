#!/bin/bash

source 'helpers.sh'

set -o nounset
set -o errexit

# Dynamically locate git binary
GIT_CMD=$(which git)

function config {
	$GIT_CMD --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

# Ensure .config-backup directory exists
mkdir -p $HOME/.config-backup || {
	echo "Failed to create backup directory."
	exit 1
}

# Attempt to checkout dotfiles
if config checkout; then
	echo "Checked out config."
else
	echo "Backing up pre-existing dot files."
	config checkout 2>&1 | grep -Po "(?<=\s)\..*" | tr '\n' '\0' | xargs -0 -I{} mv "{}" $HOME/.config-backup/ || {
		echo "Failed to backup files."
		exit 1
	}
	# Retry checkout after backing up
	config checkout || {
		echo "Checkout failed again. Aborting."
		exit 1
	}
fi

# Set git config to hide untracked files
config config status.showUntrackedFiles no
