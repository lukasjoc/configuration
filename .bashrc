#!/bin/bash
# ~/.bashrc: executed for non-login shells.

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# dont put duplicate lines in history, lines that start with a space
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
export RUST_SRC_PATH="$HOME/.cargo"
export RUSTBIN="$HOME/.cargo/bin"
export PATH=$RUST_SRC_PATH/bin:$PATH

# Go
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export GO111MODULE=on
export PATH=$GOBIN:$PATH

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
source "$HOME/.private"

# start tmux session
tmux
