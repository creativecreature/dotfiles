# dotfiles
`ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim`
`ln -sf $HOME/dotfiles/git/gitignore_global $HOME/.gitignore_global`
run `git config --global core.excludesfile ~/.gitignore_global`

run `chsh -s /bin/zsh` and then restart the computer to change shell to zsh after running the installer

first time running vim do a `:CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-emoji` to install all coc-sources
