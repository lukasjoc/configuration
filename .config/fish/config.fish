#!/usr/local/bin/fish

set -U fish_greeting
set -x EDITOR "nvim"
set -x TERM "xterm-256color"
set -U XDG_CACHE_HOME "$HOME/.cache"
set -U XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_DATA_BIN "$HOME/.local/bin"

# Rust
set -x RUST_SRC_PATH "$HOME/.cargo"
set -x RUSTBIN "$HOME/.cargo/bin"

# Go and GoMods
set -x GOPATH "$HOME/go"
set -x GOBIN "$HOME/go/bin"
set -U GO111MODULE "on"

# LaTeX
set -x TEXMFHOME "$HOME/Library/texmf"

# Php
set -x PHPBIN "$HOME/.config/composer/vendor/bin"

# Add programs to path
set -x fish_user_paths \
  "/usr/local/bin" \
  "/usr/local/sbin" \
  $XDG_DATA_BIN \
  $RUSTBIN \
  $GOBIN \
  $TEXMFHOME \
  $PHPBIN \
  $fish_user_paths

# homebrew no auto update
if command -v brew &>/dev/null
  set -x HOMEBREW_NO_AUTO_UPDATE 1;
end

# Essential aliases
alias .. "cd ../"
alias ... "cd ../../"
alias datef "date +'%d.%m.%y'"
alias python "python3"
alias pip "pip3"
alias rm "rm -i"
alias cp "cp -i"
alias mv "mv -i"
alias dc "docker-compose"
alias vi "nvim"
alias vim "nvim"
alias ls "exa -mgF --color=auto --color-scale $argv"
alias ll "ls -al --git $argv"
alias tree "tree -hastCIF '.git'"
alias watchdir "watch -d exa -magF"

