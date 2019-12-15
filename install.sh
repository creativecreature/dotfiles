#!/bin/bash



# -- Import helper scripts -----------------------------------------------------
source 'scripts/helpers.sh'



# -- Import from other scripts -------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  source 'hardware/hardware.sh'

fi



# -- Solus- or Ubuntu-Specific Setup --------------------------------------------
if system_is_solus; then
  source 'solus/solus.sh'
else
  source 'ubuntu/ubuntu.sh'
fi



# -- GIT -------------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  source 'git/git.sh'
fi



# -- SSH -------------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  source 'ssh/ssh.sh'
fi



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
if [[ "$HEADLESS" = false ]]; then
  source 'theme/theme.sh'
fi



# -- TERMINAL ----------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  source 'terminal/terminal.sh'
fi



# -- ENVIRONMENT --------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  source 'environment/environment.sh'
fi
