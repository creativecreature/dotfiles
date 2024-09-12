export ZSH="$HOME/.oh-my-zsh"
plugins=(git keychain gpg-agent z node npm zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Stop auto change of directory from zsh
unsetopt AUTO_CD

# Lang exports
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# History config
export HISTSIZE=100000                  # Number of history items in memory
export SAVEHIST=100000                  # Number of history items saved to disk
export HISTFILE="$HOME/.zsh_history"    # Path to history file
setopt HIST_IGNORE_ALL_DUPS             # Ignores all duplicate commands
setopt HIST_EXPIRE_DUPS_FIRST           # Expires older duplicates first
setopt HIST_FIND_NO_DUPS                # Avoids saving duplicates
export HISTORY_IGNORE="(ls|cd|clear|z)" # Ignore these commands

# bind ctrl-space to choose zsh autosuggestions
bindkey '^ ' autosuggest-accept

# Add volta to path
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH="$HOME/code/work/tv4-infrastructure/bin:$PATH"

# Golang
export GOROOT=$(go env GOROOT)
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
go env -w GOPRIVATE='github.com/TV4\/*'

# OSX specific setup
if [[ "$(uname)" == "Darwin" ]]; then
  export ZSH_DISABLE_COMPFIX=true
fi

# Add bin to path
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Aws region
export AWS_REGION=eu-west-1
export AWS_DEFAULT_REGION=eu-west-1

# Set nvim as default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# GPG
export GPG_TTY=$(tty)

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim=nvim
alias vi=nvim
alias gs="git status"
alias tree='tree -I node_modules -a'
alias spotify=spt

THEME="light"

# Toggle light theme
alias light="\
tmux source-file ~/dotfiles/tmux/light-theme; \
tmux set-environment THEME 'light'; \
cp $HOME/.config/ghostty/config.light $HOME/.config/ghostty/config"


# Toggle dark theme
alias dark="\
tmux source-file ~/dotfiles/tmux/dark-theme; \
tmux set-environment THEME 'dark'; \
cp $HOME/.config/ghostty/config.dark $HOME/.config/ghostty/config"

# Setup github copilot cli aliases
eval "$(github-copilot-cli alias -- "$0")"

# Make ctrl+r use fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf search with ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden -i --ignore-file '~/.rgignore'"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# Helper to detect if we are running tmux
_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}

# I always want TMUX to run
ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}
ensure_tmux_is_running

# enable zmv
autoload zmv
fpath=($fpath "/home/conner/.zfunctions")

# zsh functions
fpath+=${ZDOTDIR:-~}/.zsh_functions

export XDG_CONFIG_HOME=$HOME/.config

# Set starship ZSH as a prompt
eval "$(starship init zsh)"

# direnv needs to be hooked into the shell to work properly
eval "$(direnv hook $SHELL)"
