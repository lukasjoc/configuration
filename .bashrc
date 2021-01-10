#!/bin/bash

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
export CLICOLOR=1

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Rust
export RUST_SRC_PATH="$HOME/.cargo"
export RUSTBIN="$HOME/.cargo/bin"
export PATH=$RUST_SRC_PATH/bin:$PATH

# Go and GoMods
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
source "$ENVM_HOME/envm"

# LS_COLORS
source "$HOME/.local/share/lscolors.sh"

# Nvm
export NVM_DIR="$HOME/.config/nvm"
[[ -f "$NVM_DIR/nvm.sh" ]]; source "$NVM_DIR/nvm.sh"  # This loads nvm

# Privacy at first place right after fun :PepoDance
[[ -f "$HOME/private" ]]; source "$HOME/private"

# set C-l command to clear terminal
bind -x '"\C-l": clear'

# homebrew no auto update
if command -v brew &>/dev/null; then
  export HOMEBREW_NO_AUTO_UPDATE=1;
fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

