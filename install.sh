#!/bin/bash
# Install .dotfiles

# -- Import from other scripts -------------------------------------------------
source 'scripts/helpers.sh'



# -- Setup directory structure -------------------------------------------------
source 'scripts/setup_structure.sh'



# -- Solus- or Ubuntu-Specific Setup --------------------------------------------
if system_is_solus; then
  source 'solus/solus.sh'
else
  source 'ubuntu/ubuntu.sh'
fi



# -- GIT -----------------------------------------------------------------------
source 'git/git.sh'



# -- SSH -----------------------------------------------------------------------
source 'ssh/ssh.sh'



# -- ZSH Setup -----------------------------------------------------------------
source 'zsh/zsh.sh'



# -- NVIM -----------------------------------------------------------------------
source 'nvim/nvim.sh'



# -- TMUX -----------------------------------------------------------------------
source 'tmux/tmux.sh'



# -- ESLINT -----------------------------------------------------------------------
source 'eslint/eslint.sh'


# -- RIPGREP -----------------------------------------------------------------------
source 'ripgrep/ripgrep.sh'
