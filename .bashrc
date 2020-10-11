#!/bin/bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
	*) return;;
esac

export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000
export CLICOLOR=1

shopt -s histappend
shopt -s checkwinsize

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export EDITOR="vim"
export TERM="screen-256color"
export CLICOLOR=1

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
	
# Rust
# export RUST_SRC_PATH="$HOME/.cargo"
# export RUSTBIN="$HOME/.cargo/bin"
# export PATH=$RUST_SRC_PATH/bin:$PATH
#

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GO111MODULE=on
export PATH=$GOBIN:$PATH

# LaTeX
# export TEXMFHOME="$HOME/Library/texmf"

# EnvM stuff
export ENVM_HOME="$HOME/.envm"
source "$ENVM_HOME/envm"

# .local/bin
export PATH=$HOME/.local/bin:$PATH

# set C-l command to clear terminal
bind -x '"\C-l": clear'

# load bash completions
[[ -f /usr/local/etc/bash_completion.d ]] && source "/usr/local/etc/bash_completion.d"

# Source private variables and functions
source "$HOME/.private"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
