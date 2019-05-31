# dotfiles
run `git config --global core.excludesfile ~/.gitignore_global`

run `chsh -s /bin/zsh` and then restart the computer to change shell to zsh after running the installer

first time running vim do a `:CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-emoji` to install all coc-sources


fix ctrl-h nvim navigation

`infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti`
`tic $TERM.ti`
