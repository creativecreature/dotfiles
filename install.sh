#!/bin/bash
# Install .dotfiles

# -- Import helper scripts -----------------------------------------------------
source 'scripts/helpers.sh'



# -- Import from other scripts -------------------------------------------------
source 'hardware/hardware.sh'



# -- Setup directory structure -------------------------------------------------
source 'scripts/setup_structure.sh'



# -- Solus- or Ubuntu-Specific Setup --------------------------------------------
if system_is_solus; then
  source 'solus/solus.sh'
  sudo eopkg install git
else
  source 'ubuntu/ubuntu.sh'
  sudo apt-get update
  sudo apt-get install -y git
fi



# -- GIT -------------------------------------------------------------------------
source 'git/git.sh'



# -- SSH -------------------------------------------------------------------------
source 'ssh/ssh.sh'



# -- ZSH Setup --------------------------------------------------------------------
source 'zsh/zsh.sh'



# -- NVIM -------------------------------------------------------------------------
source 'nvim/nvim.sh'



# -- TMUX --------------------------------------------------------------------------
source 'tmux/tmux.sh'



# -- ESLINT ------------------------------------------------------------------------
source 'eslint/eslint.sh'



# -- RIPGREP -----------------------------------------------------------------------
source 'ripgrep/ripgrep.sh'



# -- THEME -------------------------------------------------------------------------
source 'theme/theme.sh'



# -- TERMINAL ----------------------------------------------------------------------
source 'terminal/terminal.sh'



# -- ENVIRONMENT --------------------------------------------------------------------
source 'environment/environment.sh'
