#!/bin/bash

# If not running interactively, don't do anything
case "$-" in
    *i*);;
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
export XDG_DATA_BIN=$HOME/.local/bin
export PATH=$XDG_DATA_BIN:$PATH

export EDITOR="vim"
export TERM="screen-256color"
export CLICOLOR=1
export CURRENT_PYTHON="python3.8"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Rust
export RUST_SRC_PATH="$HOME/.cargo"
export RUSTBIN="$HOME/.cargo/bin"
export PATH=$RUST_SRC_PATH/bin:$PATH

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GO111MODULE=on
export PATH=$GOBIN:$PATH

# LaTeX
export TEXMFHOME="$HOME/Library/texmf"

# Php
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# EnvM stuff
export ENVM_HOME="$HOME/.envm"
[[ -d "$HOME/.envm" && -z $ENVM_HOME ]]; source "$ENVM_HOME/envm"

# set C-l command to clear terminal
bind -x '"\C-l": clear'

# homebrew no auto update
if command -v brew &> /dev/null; then
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

# NVM :( like it's ok
[[ -s "/usr/local/opt/nvm/nvm.sh" ]]; source "/usr/local/opt/nvm/nvm.sh"
[[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ]]; source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
export NVM_DIR="$HOME/.config/nvm"

# Privacy at first place right after fun :PepoDance
[[ -f "$HOME/.private" ]]; source "$HOME/.private"

