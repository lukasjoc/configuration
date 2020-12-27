#!/usr/local/bin/fish

set -U fish_greeting
set -U EDITOR "nvim"
set -U TERM "xterm-256color"
set XDG_CACHE_HOME "$HOME/.cache"
set XDG_DATA_HOME "$HOME/.local/share"
set -U XDG_DATA_BIN "$HOME/.local/bin"

# Rust
set RUST_SRC_PATH "$HOME/.cargo"
set -U RUSTBIN "$HOME/.cargo/bin"

# Go and GoMods
set -U GOPATH "$HOME/go"
set -U GOBIN "$GOfish_user_paths/bin"
set GO111MODULE "on"

# Add programs to path
set -U fish_user_paths "/usr/local/bin" "/usr/local/sbin" $XDG_DATA_BIN $RUSTBIN $GOBIN $fish_user_paths

# LaTeX
set -U TEXMFHOME "$HOME/Library/texmf"

# Php
set -U PHPBIN "$HOME/.config/composer/vendor/bin"

set -U fish_user_paths \
  "/usr/local/bin" \
  "/usr/local/sbin" \
  $XDG_DATA_BIN \
  $RUSTBIN \
  $GOBIN \
  $TEXMFHOME \
  $PHPBIN $fish_user_paths

# homebrew no auto update
if command -v brew &>/dev/null
  set -U HOMEBREW_NO_AUTO_UPDATE 1;
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

