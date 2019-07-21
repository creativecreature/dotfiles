# dotfiles
run `git config --global core.excludesfile ~/.gitignore_global`

run `chsh -s /bin/zsh` and then restart the computer to change shell to zsh after running the installer

first time running vim do a `:CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-emoji` to install all coc-sources
and then run `:call coc#util#install()`


fix ctrl-h nvim navigation

`infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti`
`tic $TERM.ti`

Put this in `~/.profile` to bind caps lock to esc `setxkbmap -option caps:swapescape`

## Tmux status bar color with palenight theme
First click `ctrl s` followed by `:` to enter a command. then enter `set status-style "bg=black"`

TODO:
- Add environment in /etc/environment to dotfiles
