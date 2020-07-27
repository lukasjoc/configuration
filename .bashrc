#!/bin/bash
# ~/.bashrc: executed for non-login shells.
# init defaults

for bash_file in "/etc/bashrc" "/etc/bash.bashrc"; do
	[[ -f "$bash_file" ]] && source "$bash_file"
done

shopt -s histappend
shopt -s checkwinsize

HISTSIZE=10000
HISTFILESIZE=20000

#export XDG_CONFIG_HOME=$HOME/.config # configs
#export XDG_CACHE_HOME=$HOME/.cache # user cache/meta data
#export XDG_DATA_HOME=$HOME/.local/share # relevant user data

export EDITOR="vim"
export TERM="screen-256color"
export CLICOLOR=1

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
	
# Rust
export RUST_SRC_PATH="$HOME/.cargo"
export RUSTBIN="$HOME/.cargo/bin"
export PATH=$RUST_SRC_PATH/bin:$PATH

# Go
export GOPATH="$HOME/.go/"
export GOBIN="$GOPATH/bin"
export GO111MODULE=on
export PATH=$GOPATH/bin:$PATH

# LaTeX
export TEXMFHOME="$HOME/Library/texmf"

# EnvM stuff
export ENVM="$HOME/.envm"
export ENVM_WDIR="$HOME/fun"
export ENVM_AUTO_UPDATE_DAYS=3
source "$ENVM/envm"
# ----------

# set C-l command to clear terminal
bind -x '"\C-l": clear'

# Source private variables
# source "$HOME/.private"
