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
rm -rf $HOME/.config/nvim
ln -sfn $HOME/dotfiles/nvim $HOME/.config/nvim
echo_item "Linked nvim configuration" "green"

echo ""



# -- TMUX -----------------------------------------------------------------------
ln -sf $HOME/dotfiles/tmux/conf $HOME/.tmux.conf
echo_item "Linked tmux configuration" "green"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo_item "Cloned tmux plugin manager" "green"
ln -sf $HOME/dotfiles/tmux/tat $HOME/bin/tat
echo_item "Linked tat script" "green"

echo ""



# -- ESLINT -----------------------------------------------------------------------
ln -sf $HOME/dotfiles/eslint/eslintrc $HOME/.eslintrc
echo_item "Linked global eslint config" "green"

echo ""



# -- RIPGREP -----------------------------------------------------------------------
ln -sf $HOME/dotfiles/ripgrep/ignore $HOME/.ignore
echo_item "Linked ripgrep ignore file" "green"

echo ""
