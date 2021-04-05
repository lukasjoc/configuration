#!/bin/bash

# export PATH="/usr/local/bin:$PATH"
# export PATH="/usr/local/sbin:$PATH"


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
# export TEXMFHOME="$HOME/Library/texmf"

# PHP
# export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# EnvM stuff
export ENVM_HOME="$HOME/.envm"
source "$ENVM_HOME/envm"

# LS_COLORS
# TODO: update this to handle hidden files
# TODO: something with this is not right
# and i have this login bug repeatedly
# source "$HOME/.local/share/lscolors.sh"

# Privacy at first place right after fun :PepoDance
# [[ -f "$HOME/private" ]]; source "$HOME/private"

# set C-l command to clear terminal
# bind -x '"\C-l": clear'

# homebrew no auto update
# if command -v brew 2&>/dev/null; then
#   export HOMEBREW_NO_AUTO_UPDATE=1;
# fi

# Nvm
# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
